SHELL := bash
.ONESHELL:
.SHELLFLAGS := -eu -o pipefail -c
.DELETE_ON_ERROR:
MAKEFLAGS += --warn-undefined-variables
MAKEFLAGS += --no-builtin-rules

all: globalise.jsonld provenance.jsonld variant-matching.jsonld huc-di-tt.jsonld republic.jsonld

%.jsonld: src/%.yaml
	yq --output-format json $< > $@
