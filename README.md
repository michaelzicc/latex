## Syntax Highlighting
`LaTeX_Syntax_Notepad++.xml` is a modified version of the NuTeX.xml file from [here](https://latex.org/forum/viewtopic.php?t=23027) and can be downloaded and imported into Notepad++ for better syntax highlighting.  

To import, in Notepad++, select "Language" from the menu bar, then select "Define your language..." near the bottom.  In the window that pops up, click "Import..." and then select this LaTeX_Syntax_Notepad++.xml file and click "Open."  A message should pop up saying the import was successful.  Now, anytime you open a file in Notepad++ with the `.tex` extension, the syntax highlighting defined in this file will be used. 

**Note:** The colors used in these definitions are meant to be used with a darker Notepad++ theme.  This can be changed from "Settings" -> "Style Configurator".  Checking the box to use a Global Background Color will also probably be beneficial.  

## Compiling
`CompileAndPreview.bat` can be used to compile a TeX file to a PDF and preview the file with SumatraPDF.  There are several versions of this script floating around on the web; I don't remember where I originally got it. This has been modified to add an option for choosing the bibliography compiler.  

### Compiling from Notepad++
The NppExec extension can be used to call this batch file with the following code (of course the path to the file will need to be changed).
```
npp_save
"C:\Path\To\Batch\File\CompileAndPreview.bat" "$(CURRENT_DIRECTORY)" "$(NAME_PART)" "bibtex"
```
