virtio-spec.pdf: virtio-spec.tex
	pdflatex $<

virtio-spec.tex: virtio-spec.lyx
	lyx -batch -e pdflatex $<

virtio-spec.txt: .virtio-spec.txt
	echo '[Generated file: see http://ozlabs.org/~rusty/virtio-spec/]' > $@
	sed 's/ *$$//' < .virtio-spec.txt >> $@

.virtio-spec.txt: virtio-spec.lyx
	lyx -batch -e text $<
	mv virtio-spec.txt $@

clean:
	rm -f virtio-spec.txt .virtio-spec.txt
