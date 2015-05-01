all: html pdf docx rtf txt epub

pdf: resume.pdf
resume.pdf: resume.md
	pandoc --standalone --template style.tex \
	--from markdown --to context \
	-V papersize=letter \
	-o resume.tex resume.md; \
	context resume.tex

html: resume.html
resume.html: style.css resume.md
	pandoc --standalone -H style.css \
        --from markdown --to html \
        -o resume.html resume.md

docx: resume.docx
resume.docx: resume.md
	pandoc -s -S resume.md -o resume.docx

rtf: resume.rtf
resume.rtf: resume.md
	pandoc -s -S resume.md -o resume.rtf

txt: resume.txt
resume.txt: resume.md
	pandoc -s -S resume.md -o resume.txt

epub: resume.epub
resume.epub: resume.md
	pandoc -S resume.md -o resume.epub

clean:
	rm resume.html
	rm resume.tex
	rm resume.tuc
	rm resume.log
	rm resume.pdf
	rm resume.docx
	rm resume.rtf
	rm resume.epub
