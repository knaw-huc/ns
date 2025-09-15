# Text & Annotation vocabulary

## Introduction

This page documents in what form annotations and texts are made available by Team Text,
Digital Infrastructure, KNAW Humanities Cluster.

The aims are:

1. to ensure all vocabulary we use is properly documented and formalised
2. to unify vocabularies as much as possible so we don't have different concepts for the same things in different places.
3. to employ a consistent vocabulary in various projects and amongst various software components
4. to make clear which tools in our pipeline rely on what vocabulary to function.
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
[RFC5147](https://www.rfc-editor.org/rfc/rfc5147.txt), as well as a secondary
text referencing API inspired by IIIF.

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
that is distinct but largely derived from the above. The vocabulary is formalised and documented in two different modules:

1. Text structure (SKOS)
    * Ontology: [text.json](text.json) with [documentation](text.md)
    * JSON-LD context: [text.jsonld](text.jsonld) 
        * This will be served at  <https://ns.huc.knaw.nl/text.jsonld>.
2. Properties for Text & Annotations
    * Ontology: [textannodata.json](textannodata.json)
        * This ontology is kept as small as possible, and contains only those properties
          for which we found no suitable mapping in an existing ontology.
    * JSON-LD context: [textannodata.jsonld](textannodata.jsonld) (documentation: see *Mapping properties* section)
        * We prefer to map properties to existing properties in other ontologies (such as schema.org)
        * This will be served at  <https://ns.huc.knaw.nl/textannodata.jsonld>.

### Anatomy of a Web Annotation

The following example shows an example web annotation:

```json
{
  "@context": [
    "http://www.w3.org/ns/anno.jsonld",
    "https://ns.huc.knaw.nl/text.jsonld",
    "https://ns.huc.knaw.nl/textannodata.jsonld",
  ],
  "type": "Annotation",
  "id": "https://preview.dev.diginfra.org/annorepo/w3c/israels/9a9422f7-f796-4c4a-afe8-f94579f36c81",
  "purpose": "tagging",
  "generated": "2025-07-14T10:55:11.190970",
  "body": {
    "id": "urn:someproject:letter:001",
    "type": "Letter",
    "manifest": "https://preview.dev.diginfra.org/files/israels/static/manifests/letters/ii001.json",
    "recipient": {
            "type": "Person",
            "name": "Jo van Gogh-Bonger",
    },
    "identifier": "ii001",
    "provider": {
            "type": "Organization",
            "name": "Van Gogh Museum",
    }
    "location": {
            "type": "Place",
            "name": "Amsterdam, The Netherlands",
    }
    "TODO:msId": "b8564V2008",
    "datePublished": "1891-02-02",
    "sender": {
            "type": "Person",
            "name": "Isaac Israëls",
    },
    "next": "urn:israels:letter:ii002",
    "titles": {
      "nl": "Isaac Israëls aan Jo van Gogh-Bonger. Amsterdam, 2 februari 1891.",
      "en": "Isaac Israëls to Jo van Gogh-Bonger. Amsterdam, 2 February 1891."
    }        
  },
  "target": {
    {
      "source": "https://preview.dev.diginfra.org/textsurf/israels/001.txt?char=0,1234",
      "type": "Text",
    },
    {
      "source": "https://preview.dev.diginfra.org/textsurf/israels/001.txt",
      "type": "Text",
      "selector": {
        "type": "TextPositionSelector",
        "start": 0,
        "end": 1234
      }
    },
    {
      "source": "https://preview.dev.diginfra.org/textsurf/api2/israels|001.txt/0,1234",
      "type": "Text",
    },
    {
      "source": "https://preview.dev.diginfra.org/sources/israels/ii001.xml",
      "type": "Text",
      "selector": {
        "type": "XPathSelector",
        "value": "//tei:body",
      }
   },
    {
      "source": "https://preview.dev.diginfra.org/files/israels/static/manifests/letters/ii001.json/canvas/israels/pages/b8564V2008_b",
      "type": "Canvas"
    },
    {
      "source": "https://preview.dev.diginfra.org/files/israels/static/manifests/letters/ii001.json/canvas/israels/pages/b8564V2008_b",
      "type": "Canvas",
      "selector": [
        {
          "@context": "http://iiif.io/api/annex/openannotation/context.json",
          "type": "iiif:ImageApiSelector",
          "region": "0,0,4136,6200"
        }
      ]
    },
    {
      "source": "https://tt-iiif.dev.diginfra.org/iiif/3/israels|pages|b8564V2008_b.jpg/0,0,4136,6200/max/0/default.jpg",
      "type": "Image"
    },
    {
      "source": "https://tt-iiif.dev.diginfra.org/iiif/3/israels|pages|b8564V2008_b.jpg/full/max/0/default.jpg",
      "type": "Image",
      "selector": [
        {
          "type": "FragmentSelector",
          "conformsTo": "http://www.w3.org/TR/media-frags/",
          "value": "xywh=0,0,4136,6200"
        }
      ]
    },
    {
      "source": "https://preview.dev.diginfra.org/files/israels/static/manifests/letters/ii001.json/canvas/israels/pages/b8564V2008_vs_b",
      "type": "Canvas",
      "selector": [
        {
          "@context": "http://iiif.io/api/annex/openannotation/context.json",
          "type": "iiif:ImageApiSelector",
          "region": "0,0,8272,6200"
        }
      ]
    },
    {
      "source": "https://tt-iiif.dev.diginfra.org/iiif/3/israels|pages|b8564V2008_vs_b.jpg/0,0,8272,6200/max/0/default.jpg",
      "type": "Image"
    },
    {
      "source": "https://tt-iiif.dev.diginfra.org/iiif/3/israels|pages|b8564V2008_vs_b.jpg/full/max/0/default.jpg",
      "type": "Image",
      "selector": [
        {
          "type": "FragmentSelector",
          "conformsTo": "http://www.w3.org/TR/media-frags/",
          "value": "xywh=0,0,8272,6200"
        }
      ]
    }
  }
}
```

**Note**: Parts with prefix *TODO:* are still be reconciled with into the new vocabulary.

### Mapping properties

We try to map properties for text and annotation, as extracted from the various sources (e.g. TEI, PageXML), to existing linked open data ontologies. Only if no suitable property can be found, do we create one of our own in [textannodata.json](textannodata.json).

The following custom target properties are defined in the [textannodata.json](textannodata.json) ontology:

**Note:** The links in these table are URIs in the RDF sense. Whilst it is good practise that they are resolvable as URLs, they may not be necessarily so.

| Alias | Property | Description        |
| ----- | -------- | ------------------ |
| n | <https://ns.huc.knaw.nl/textannodata/n> |  Sequence number |
| style | <https://ns.huc.knaw.nl/textannodata/style> |  Encodes the rendition style of a piece of text. The vocabulary is open-ended and may contain terms as 'italic', 'bold','underlined', common color names (red,blue,green) or `#rrggbb` color codes. This property is expected on Highlight annotations. |

The following properties from existing ontologies are defined in the [textannodata.jsonld](textannodata.jsonld) JSON-LD context:

| Alias | Property | Description        |
| ----- | -------- | ------------------ |
| address | <http://schema.org/address> |  Physical address of the item |
| dateCreated | <http://schema.org/dateCreated> |  Date of creation |
| dateModified | <http://schema.org/dateModified> |  Date of modification |
| datePublished | <http://schema.org/datePublished> |  Date of first publication |
| description | <http://purl.org/dc/terms/description> | Description of something |
| descriptions | <http://purl.org/dc/terms/description> | Description of something (in `@language` container) |
| editor | <http://schema.org/editor> |  Specifies the Person who edited the CreativeWork. |
| genre | <http://schema.org/genre> | Genre of the creative work (text or URL) |
| identifier | <http://purl.org/dc/terms/identifier> | An unambiguous reference to the resource within a given context. Recommended practice is to identify the resource by means of a string conforming to an identification system. Examples include International Standard Book Number (ISBN), Digital Object Identifier (DOI), and Uniform Resource Name (URN). Persistent identifiers should be provided as HTTP URIs. |
| image | <http://schema.org/image> | An image of the item |
| keywords | <http://schema.org/keywords> | Keywords or tags used to describe some item. Multiple textual entries in a keywords list are typically delimited by commas, or by repeating the property. | 
| knows | <http://schema.org/knows> | The most generic bi-directional social/work relation. Used with schema:Person (domain + range). |
| license | <http://schema.org/license> | A license document that applies to this content, typically indicated by URL |
| location | <http://schema.org/location> | Location of something (e.g. where the resource was published), text or URL or Place |
| manifest | <http://iiif.io/api/presentation/3#hasManifests> | Link to IIIF manifest (may be list of multiple) |
| participant | <http://schema.org/participants> | Other co-agents that participated in the action indirectly. |
| producer | <http://schema.org/producer> | The person or organization who produced the work. Expects a non-literal. |
| provider | <http://schema.org/provider> | The service provider, service operator, or service performer; the goods producer. Another party (a seller) may offer those services or goods on behalf of the provider. A provider may also serve as the seller. Expects a non-literal (Organization or Person) |
| publisher | <http://purl.org/dc/terms/publisher> | An entity responsible for making the resource available. Expects a non-literal (Organization or Person) |
| recipient | <http://schema.org/recipient> | The participant who is at the receiving end of the action. Expects a non-literal (Organization or Person) |
| references | <http://purl.org/dc/terms/references> | A related resource that is referenced, cited, or otherwise pointed to by the described resource. This property is intended to be used with non-literal values. |
| relation | <http://purl.org/dc/terms/relation> | A related resource. Recommended practice is to identify the related resource by means of a URI. If this is not possible or feasible, a string conforming to a formal identification system may be provided. |
| replaces | <http://purl.org/dc/terms/replaces> |  A related resource that is supplanted, displaced, or superseded by the described resource. this property is intended to be used with non-literal values. |
| sender | <http://schema.org/sender> | The participant who is at the sending end of the action. |
| sourceUrl | <http://purl.org/dc/terms/source> | URL to where a resource was sourced from |
| subject | <http://purl.org/dc/terms/subject> | A topic of the resource. Recommended practice is to refer to the subject with a URI. If this is not possible or feasible, a literal value that identifies the subject may be provided. Both should preferably refer to a subject in a controlled vocabulary. |
| title | <http://purl.org/dc/terms/title> | Title |
| titles | <http://purl.org/dc/terms/title> | Title (in `@language` container) |

The following (non-exhaustive!) properties come from the [W3C Web Annotation (anno.jsonld)](anno.jsonld) JSON-LD context:

| Alias | Property | Description        |
| ----- | -------- | ------------------ |
| audience | <http://schema.org/audience> | An intended audience, i.e. a group for whom something was created. |
| created | <http://purl.org/dc/terms/created> | Date of creation |
| creator | <http://purl.org/dc/terms/creator> | An entity primarily responsible for making the resource. Typically, the name of a Creator should be used to indicate the entity. |
| conformsTo | <http://purl.org/dc/terms/conformsTo>  | An established standard to which the described resource conforms. |
| email  | <http://xmlns.com/foaf/0.1/email> | E-mail address |
| format | <http://purl.org/dc/elements/1.1/format> | The file format, physical medium, or dimensions of the resource. | 
| generator | <http://www.w3.org/ns/activitystreams#generator> | Identifies the entity (e.g. an application) that generated the object.  |
| generated | <http://purl.org/dc/terms/issued> | Date of generation/publication/generation |
| language | <http://purl.org/dc/elements/1.1/language> | A language of the resource.  Recommended practice is to use either a non-literal value representing a language from a controlled vocabulary such as ISO 639-2 or ISO 639-3, or a literal value consisting of an IETF Best Current Practice 47 [IETF-BCP47] language tag. |
| label | <http://www.w3.org/2000/01/rdf-schema#label> | Ties a human-readable label to something |
| modified | <http://purl.org/dc/terms/modified> | Date of modification |
| next | <http://www.w3.org/ns/activitystreams#next> | Used to link one item to the next one (of the same type) in a sequence |
| partOf | <http://www.w3.org/ns/activitystreams#partOf> | marks something as a part of something bigger |
| prev | <http://www.w3.org/ns/activitystreams#prev> | Used to link one item to the previous one (of the same type) in a sequence |
| rights | <http://purl.org/dc/elements/1.1/rights> | Information about rights held in and over the resource. Recommended practice is to refer to a rights statement with a URI. If this is not possible or feasible, a literal value (name, label, or short text) may be provided. | 

The following aliases from the [W3C Web Annotation (anno.jsonld)](anno.jsonld) JSON-LD context are [overridden](https://www.w3.org/TR/json-ld/#advanced-context-usage) by definitions in [textannodata.jsonld](textannodata.jsonld):

| Alias | W3C Web Annotation | Overriden        |
| ----- | -------- | ------------------ |
| Person | <http://xmlns.com/foaf/0.1/Person> | <http://schema.org/Person> |
| Organization | <http://xmlns.com/foaf/0.1/Organization> | <http://schema.org/Organization> |
| name | <http://xmlns.com/foaf/0.1/name>  | <http://schema.org/name> | 

The following table maps some (non-exhaustive) [old-style properties (not further formalised)](https://github.com/knaw-huc/team-text-backlog/issues/128) to the new ones:

| Old | New     |
| ----- | -------- |
| institution | provider |
| eid/entityId | identifier |
| fileId/letterId/pageId | identifier |
| idno | identifier |
| headerId | identifier |
| nextLetter/nextFile/nextPage | next |
| prevLetter/prevFile/prevPage | prev |
| correspondent | recipient (structured!) |
| sender | sender (structured!) |
| pageUrl | url |
| displayLabel | label |
| rend | style |

