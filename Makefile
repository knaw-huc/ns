.DELETE_ON_ERROR:
.PHONY: deps docker all clean
MAKEFLAGS += --warn-undefined-variables
MAKEFLAGS += --no-builtin-rules
OS := $(shell uname)

ifeq ($(OS),Darwin)
	DISTRO = mac
else
	DISTRO = $(shell . /etc/os-release; echo $$ID)
endif

all: globalise.jsonld provenance.jsonld variant-matching.jsonld huc-di-tt.jsonld republic.jsonld text.nq text.md text.html text_intro.html index.html

clean: 
	rm -f text.nq text.md text.html text_intro.html index.html

%.jsonld: src/%.yaml
	yq --output-format json $< > $@

%-expanded.json: %.json
	jsonld expand -l -a all $< > $@

%.nq: %.json
	jsonld format -f n-quads -l -a all $< > $@

%.md: %.json
	python helpers/skosConverter/skos_converter.py to-markdown text.json

%.html: %.md
	sed -r "s/\((.*).md\)/(\1.html)/g" $< | pandoc --from gfm --output $@

index.html: README.md
	sed -r "s/\((.*).md\)/(\1.html)/g" $< | pandoc --from gfm --output $@

deps:
	@echo "Installing dependencies, you probably want to run this with sudo to install globally, but note that jsonld-cli will be installed globally from NPM rather than from a package!"
ifeq ($(DISTRO),arch)
	pacman -S yq npm pandoc
else ifeq ($(DISTRO),$(filter $(DISTRO), debian ubuntu))
	apt-get install yq npm pandoc
else ifeq ($(DISTRO),$(filter $(DISTRO), fedora redhat))
	yum install yq npm pandoc
else ifeq ($(DISTRO),$(filter $(DISTRO), alpine postmarketos))
	apk add yq npm pandoc
else ifeq ($(DISTRO),mac)
	brew install yq npm pandoc
endif
	npm install -g jsonld-cli

docker:
	docker build -t knaw-huc/ns .
