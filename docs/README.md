# Annotation vocabulary documentation

## Introduction

This page documents in what form annotations are made available by Team Text,
Digital Infrastructure, KNAW Humanities Cluster.

The aims are:

1. to ensure all vocabulary we use is properly documented and formalised
2. to unify vocabularies as much as possible so we don't have different concepts for the same things in different places.
3. to employ a consistent vocabulary in various projects and amongst various software components
4. to make clear to which tools in our pipeline rely on what vocabulary to function.
5. to adhere to and reuse established standards (like the W3C Web Annotation Data Model) as much as possible and minimise the addition of new vocabulary 

You can read more about our service-oriented architecture
[here](https://documentatie.di.huc.knaw.nl/teams/text/architecture/).

## Stand-off annotation using the Web Annotation Data Model

We use a data model where annotations on text (and other media) are formulated
in a strict stand-off fashion. This can be contrasted to data models that
follow a document object model where text and annotation live in the same
representation and annotations are often in-place. The latter is common in
XML-based formats as well as HTML.

Our annotations follow the [W3C Web Annotation Data
Model](https://www.w3.org/TR/annotation-model/) and are serialized in JSON-LD.
The JSON-LD context file <https://www.w3.org/ns/anno.jsonld> defines a mapping
to this data model for use in JSON-LD serialisations, and this is the primary
context file we use. In our service oriented architecture, the annotations are
loaded into and served via [AnnoRepo](https://github.com/knaw-huc/annorepo),
which implements the [W3C Web Annotation
Protocol](https://www.w3.org/TR/annotation-protocol/).

The texts subject to annotation are distinct from the annotations themselves
and are delivered in plain text format (UTF-8 encoding). They will be served
via [TextSurf](https://github.com/knaw-huc/textsurf), which implements a text
referencing API with addressing syntax derived from
[RFC5147](https://www.rfc-editor.org/rfc/rfc5147.txt).

We use the term *untangling* to refer to the process of splitting a rich
annotated document format like [TEI
XML](https://tei-c.org/release/doc/tei-p5-doc/en/html/index.html),
[PageXML](https://github.com/PRImA-Research-Lab/PAGE-XML) or [FoLiA
XML](https://proycon.github.io/folia/) to strict stand-off annotations on plain
text.

Adopting stand-off annotation allows us a maximum amount of flexibility; we are
not constrained by limitations in the original input formats (such as
limitations in what annotations can overlap) and any idiosyncrasies of the
original data model can be smoothed out in the untangling process. The
decoupling of text and annotation also facilitates scaling and a distributed
service infrastructure.

## Vocabulary

Formats like TEI, FoLiA and PageXML themselves define a vocabulary pertaining to textual structure and annotations.

As our data comes from a variety of sources, we use a common basic vocabulary
that is distinct but largely derived from the above.

### Anatomy of a Web Annotation

The following example shows a skeleton for a minimal web annotation:

```json
{
  "@context": [
    "http://www.w3.org/ns/anno.jsonld",
    "https://humanities.knaw.nl/ns/text.jsond",
  ],
  "type": "Annotation",
  "id": "https://preview.dev.diginfra.org/annorepo/w3c/someproject/9a9422f7-f796-4c4a-afe8-f94579f36c81",
  "purpose": "tagging",
  "generated": "2025-07-14T10:55:11.190970",
  "body": {
    "id": "urn:someproject:letter:001",
    "type": "Letter",
  },
  "target": {
    {
      "source": "https://preview.dev.diginfra.org/textsurf/someproject/001.txt?char=0,1234",
      "type": "Text",
    },
    {
      "source": "https://preview.dev.diginfra.org/textsurf/someproject/001.txt",
      "type": "Text",
      "selector": {
        "type": "TextPositionSelector",
        "start": 0,
        "end": 1234
      }
    }
  }
}
```
