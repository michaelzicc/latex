:: Called from Notepad++ Run
:: [path_to_bat_file] "$(CURRENT_DIRECTORY)" "$(NAME_PART)" "[bibtex or biber]"
 
:: Change Drive and  to File Directory
%~d1
cd %1

:: Run Cleanup
call:cleanup
 
:: Run pdflatex -&gt; bibtex -&gt; pdflatex -&gt; pdflatex
pdflatex  -synctex=1 -interaction=nonstopmode %2

IF %3=="bibtex" (
	Echo "Using bibtex"
	bibtex  %2
) ELSE (
	Echo "Using biber"
	biber %2
)
:: If you are using multibib the following will run bibtex on all aux files
:: FOR /R . %%G IN (*.aux) DO bibtex %%G
pdflatex  -synctex=1 -interaction=nonstopmode %2
pdflatex  -synctex=1 -interaction=nonstopmode %2
 
:: Run Cleanup
call:cleanup
 
:: Open PDF (Script updated based on comments by 'menfeser'
:: START "" "C:\Program Files\Adobe\Reader 9.0\Reader\AcroRd32.exe" %2.pdf
:: START "" %2.pdf
 
:: (Alternative) Open PDF with Sumatra PDF
START "" "C:\Program Files\SumatraPDF\SumatraPDF.exe" %2.pdf -reuse-instance 
 
:: Cleanup Function
:cleanup
del *.log
del *.dvi
del *.aux
del *.bbl
del *.blg
del *.brf
del *.out
del *.bcf
del *.xml
del *.gz
goto:eof
