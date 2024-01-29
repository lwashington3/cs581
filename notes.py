from datetime import date
from xml.etree import ElementTree


def create_tex_file(date:date, datefmt:str, file:str):
	with open(file, 'w') as f:
		formatted_date = f"{date:%-#m-%d-%Y}"
		f.write(fr"""%! Author = Len Washington III
%! Date = {date:%-#m/%d/%Y}
%! compiler = pdflatex

% Preamble
\documentclass[title={{{date.strftime(datefmt)} Notes}}]{{cs581notes}}

% Document
\begin{{document}}

%<*{formatted_date}>

%</{formatted_date}>

\end{{document}}""")


def create_notes_conf(date:date, datefmt):
	with open(f".idea/runConfigurations/{date:%B_%d__%Y_Notes.xml}", 'w') as file:
		file.write(f"""<component name="ProjectRunConfigurationManager">
	<configuration default="false" name="{date.strftime(datefmt)} Notes" type="LATEX_RUN_CONFIGURATION" factoryName="LaTeX configuration factory" folderName="{date:%B} Notes">
		<texify>
			<compiler>PDFLATEX</compiler>
			<compiler-path />
			<sumatra-path />
			<pdf-viewer>NONE</pdf-viewer>
			<viewer-command>pdfopener</viewer-command>
			<compiler-arguments />
			<envs />
			<main-file>$PROJECT_DIR$/src/notes/{date:%-#m-%d-%Y}.tex</main-file>
			<output-path>$PROJECT_DIR$/out/notes</output-path>
			<auxil-path>$PROJECT_DIR$/auxil/notes</auxil-path>
			<compile-twice>false</compile-twice>
			<output-format>PDF</output-format>
			<latex-distribution>MIKTEX</latex-distribution>
			<has-been-run>true</has-been-run>
			<bib-run-config>[]</bib-run-config>
			<makeindex-run-config>[]</makeindex-run-config>
		</texify>
		<method v="2" />
	</configuration>
</component>""")


def create_makeindex_conf(root:ElementTree, date:date, datefmt, month, texfile):
	manager = root.find("./component[@name='RunManager']")

	notes = ElementTree.SubElement(manager, "configuration", attrib={"name": date.strftime(f"{datefmt} Makeindex"),
																	 "type": "MAKEINDEX_RUN_CONFIGURATION",
																	 "factoryName": "LaTeX configuration factory",
																	 "folderName": f"{month} Notes"})

	makeindex = ElementTree.SubElement(notes, "texify-makeindex")
	ElementTree.SubElement(makeindex, "program").text = "MAKEINDEX"
	ElementTree.SubElement(makeindex, "main-file").text = f"$PROJECT_DIR$/src/notes/{texfile}"
	ElementTree.SubElement(makeindex, "command-line-args")
	ElementTree.SubElement(makeindex, "work-dir").text = "$PROJECT_DIR$/auxil/notes"

	ElementTree.SubElement(notes, "method", attrib={"v": "2"})


def add_confs_to_list(root:ElementTree, date:date, datefmt):
	manager = root.find("./component[@name='RunManager']/list")

	ElementTree.SubElement(manager, "item", attrib={"itemvalue": f"LaTeX.{date.strftime(datefmt)} Notes"})
	ElementTree.SubElement(manager, "item", attrib={"itemvalue": f"Makeindex.{date.strftime(datefmt)} Makeindex"})


def main(date:date):
	datefmt = "%B %d, %Y"
	month = date.strftime("%B")
	file = date.strftime("%-#m-%d-%Y.tex")

	create_tex_file(date, datefmt, f"src/notes/{file}")
	create_notes_conf(date, datefmt)

	# create_makeindex_conf(root, date, datefmt, month, file)


if __name__ == "__main__":
	main(date.today())
