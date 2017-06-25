DEST=~/install/bin/

install: render.py
	install $< $(DEST)
	install *.so $(DEST)

README.md: README.md.t
	# requires `macro_expander` (https://github.com/CD3/macro_expander)
	expand-macros.py README.md.t README.md


run:
	./render.py -a --overwrite -e Tempita -c example.yaml
