f=chan

l: latex
e: edit
x: xdvi

latex:
	latex  ${f}

edit:
	emacs  ${f}.tex -geometry 80x40 &

xdvi:
	xdvi   ${f} -s 4 -geometry 1374x950 &

clean:
	-rm -f ${f}.aux ${f}.dvi ${f}.log ${f}.out
	-rm -f *~
