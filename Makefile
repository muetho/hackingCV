.PHONY: cv
cv:
	@echo "[i] build the CV"
	pdflatex template.tex

clean:
	@echo "[i] remove temporary files"
	rm *.pdf
	rm *.aux
	rm *.log
	rm *.out 
