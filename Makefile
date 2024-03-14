all: globalise.jsonld provenance.jsonld variant-matching.jsonld huc-di-tt.jsonld republic.jsonld
#globalise.jsonld: src/globalise.yaml
#	yq -o json src/globalise.yaml > globalise.jsonld

%.jsonld: src/%.yaml
	yq -o json $< > $@
