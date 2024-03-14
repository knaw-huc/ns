all: globalise.jsonld provenance.jsonld variant-matching.jsonld huc-di-tt.jsonld republic.jsonld

%.jsonld: src/%.yaml
	yq --output-format json $< > $@
