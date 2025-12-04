# TextStructure

_Definition:_ A category that groups concepts that mark structure in text  
_URI:_ <https://ns.huc.knaw.nl/text/TextStructure>



## Caption

_Definition:_ Text that constitutes the caption for a figure or table. Does not include the number or marker (see FigureMarker or TableMarker).  
_URI:_ <https://ns.huc.knaw.nl/text/Caption>
_Same as:_ <http://www.tei-c.org/ns/1.0#caption>, <https://w3id.org/folia/v2/Caption>  


## Cell

_Definition:_ Text that constitutes a single cell in a table  
_URI:_ <https://ns.huc.knaw.nl/text/Cell>
_Same as:_ <http://www.tei-c.org/ns/1.0#cell>, <https://w3id.org/folia/v2/Cell>  


## Column

_Definition:_ Text that corresponds to a column in a multi-columned layout. Not used in tables.  
_URI:_ <https://ns.huc.knaw.nl/text/Column>


## Correction

_Definition:_ A correction on a text  
_URI:_ <https://ns.huc.knaw.nl/text/Correction>
_Same as:_ <http://www.tei-c.org/ns/1.0#corr>, <https://w3id.org/folia/v2/Correction>  


## Division

_Definition:_ An arbitrary generic grouping of a larger amount of text in discourse.  
_URI:_ <https://ns.huc.knaw.nl/text/Division>
_Same as:_ <http://schema.primaresearch.org/PAGE/gts/pagecontent/2013-07-15/TextRegion>, <http://www.tei-c.org/ns/1.0#div>, <https://w3id.org/folia/v2/Division>  


## Entity

_Definition:_ A span of text that refers to some kind of named entity  
_URI:_ <https://ns.huc.knaw.nl/text/Entity>
_Same as:_ <http://www.tei-c.org/ns/1.0#rs>, <http://www.tei-c.org/ns/1.0#name>, <https://w3id.org/folia/v2/Entity>  


## Figure

_Definition:_ A part of the document that contains one or more images, may be accompanied by a caption.  
_URI:_ <https://ns.huc.knaw.nl/text/Figure>
_Same as:_ <http://www.tei-c.org/ns/1.0#figure>, <https://w3id.org/folia/v2/Figure>  


## FigureMarker

_Definition:_ Figure number or marker. Should be adjacent to the Figure (i.e. not embedded).
_URI:_ <https://ns.huc.knaw.nl/text/FigureMarker>


## Head

_Definition:_ Head of a section or subsection.
_URI:_ <https://ns.huc.knaw.nl/text/Head>
_Same as:_ <http://www.tei-c.org/ns/1.0#head>, <https://w3id.org/folia/v2/head>  

## HeadMarker

_Definition:_ Number/marker of a section or subsection. Should be adjacent to the Head (i.e. not embedded).
_URI:_ <https://ns.huc.knaw.nl/text/HeadMarker>


## Highlight

_Definition:_ A highlighted/emphasised/stylized piece of text, in some presentational form. Use the style property to encode the form.  
_URI:_ <https://ns.huc.knaw.nl/text/Highlight>
_Same as:_ <http://www.tei-c.org/ns/1.0#hi>, <https://w3id.org/folia/v2/TextMarkupStyle>  


## Image

_Definition:_ Part of the document where an image is located. Non-textual.  
_URI:_ <https://ns.huc.knaw.nl/text/Image>
_Same as:_ <http://www.tei-c.org/ns/1.0#graphic>  


## Letter

_Definition:_ A body of text that represents written correspondence/communication between people. Letters should not overlap.  
_URI:_ <https://ns.huc.knaw.nl/text/Letter>


## Line

_Definition:_ A line in text structure. A line is physically stretches accross one specific spatial dimension (the presentational orientation is not specified nor implied). A line itself by definitions contains no linebreaks/newlines (including leading/trailing newlines). Note that lines may overlap arbitrarily with sentences and words! An optional line marker/number is not part of the line but precedes it.  
_URI:_ <https://ns.huc.knaw.nl/text/Line>
_Same as:_ <http://schema.primaresearch.org/PAGE/gts/pagecontent/2013-07-15/TextLine>, <http://www.tei-c.org/ns/1.0#Line>  


## LineMarker

_Definition:_ A marker that precedes a line, for example an explicit line number in the text. Should be adjacent to the Line annotation itself.
_URI:_ <https://ns.huc.knaw.nl/text/LineMarker>


## Linebreak

_Definition:_ Point at which one line ends and a new line is formed. This annotation is only used in contexts where line breaks are not already implied and should be used sparingly.  The so-called carriage-return is already implied and not encoded separately.  
_URI:_ <https://ns.huc.knaw.nl/text/Linebreak>
_Same as:_ <http://www.tei-c.org/ns/1.0#lb>, <https://w3id.org/folia/v2/Linebreak>  


## List

_Definition:_ A text portion that contains an enumerisation of itemisation of different items, often separated demarked by a bullet, hyphen or numeral.  
_URI:_ <https://ns.huc.knaw.nl/text/List>
_Same as:_ <http://www.tei-c.org/ns/1.0#list>, <https://w3id.org/folia/v2/List>  


## ListItem

_Definition:_ An item in a list. Does not include the marker (numeral/bullet/hyphen).  
_URI:_ <https://ns.huc.knaw.nl/text/ListItem>
_Same as:_ <http://www.tei-c.org/ns/1.0#item>, <https://w3id.org/folia/v2/ListItem>  


## ListItemMarker

_Definition:_ The numeral/bullet/hyphen that marks items in a list. Should be left-adjacent to the ListItem (i.e. not embedded) and embedded within a List.

_URI:_ <https://ns.huc.knaw.nl/text/ListItemMarker>


## Note

_Definition:_ A footnote, endnote or note in the marginalia.  
_URI:_ <https://ns.huc.knaw.nl/text/Note>
_Same as:_ <http://www.tei-c.org/ns/1.0#note>, <https://w3id.org/folia/v2/Note>  


## NoteMarker

_Definition:_ A marker/number for a note, footnote, endnote. Should be adjacent to the actual note (i.e. not embedded).
_URI:_ <https://ns.huc.knaw.nl/text/NoteMarker>


## Page

_Definition:_ A large span of text on the same unit of a certain physical medium. Pages should not overlap.  
_URI:_ <https://ns.huc.knaw.nl/text/Page>
_Same as:_ <http://schema.primaresearch.org/PAGE/gts/pagecontent/2013-07-15/Page>  


## PageMarker

_Definition:_ A page number or other form of page marker. May be embedded or adjacent to a Page.  
_URI:_ <https://ns.huc.knaw.nl/text/PageMarker>


## Paragraph

_Definition:_ A self-contained unit of discourse. Leading/trailing whitespace or newlines are not included.  
_URI:_ <https://ns.huc.knaw.nl/text/Paragraph>
_Same as:_ <http://www.tei-c.org/ns/1.0#p>, <https://w3id.org/folia/v2/Paragraph>  


## Quote

_Definition:_ Text representing a quote or citation  
_URI:_ <https://ns.huc.knaw.nl/text/Quote>
_Same as:_ <http://www.tei-c.org/ns/1.0#q>, <https://w3id.org/folia/v2/Quote>  


## Reference

_Definition:_ A reference to another location, either in the text, such as to a footnote/endnote, or an external URI. Use with schema:url.  
_URI:_ <https://ns.huc.knaw.nl/text/Reference>
_Same as:_ <http://www.tei-c.org/ns/1.0#ref>, <https://w3id.org/folia/v2/Reference>  


## Row

_Definition:_ Text that constitutes a row in a table  
_URI:_ <https://ns.huc.knaw.nl/text/Row>
_Same as:_ <http://www.tei-c.org/ns/1.0#row>, <https://w3id.org/folia/v2/Row>  


## Section

_Definition:_ A grouping of a larger amount of text in discourse. This is more specific than 'Division'. Sections often carry numbering, headers, and they can be nested in a hierarchy where sections in sections form subsections, and so on. They may be fully embedded within eachother (nesting), but may not otherwise overlap.  
_URI:_ <https://ns.huc.knaw.nl/text/Section>
_Related:_ <https://ns.huc.knaw.nl/text/Division>  


## Sentence

_Definition:_ A grammatically complete syntactic unit, consisting of words.  
_URI:_ <https://ns.huc.knaw.nl/text/Sentence>
_Same as:_ <https://w3id.org/folia/v2/Sentence>, <http://www.tei-c.org/ns/1.0#s>  


## Span

_Definition:_ An arbitrary generic grouping of a relatively small amount of text.  
_URI:_ <https://ns.huc.knaw.nl/text/Span>
_Same as:_ <http://www.tei-c.org/ns/1.0#span>, <https://w3id.org/folia/v2/String>  


## Table

_Definition:_ Text that constitutes a table  
_URI:_ <https://ns.huc.knaw.nl/text/Table>
_Same as:_ <http://www.tei-c.org/ns/1.0#table>, <https://w3id.org/folia/v2/Table>  


## TableMarker

_Definition:_ Table number or marker. Should be adjacent to a Table.
_URI:_ <https://ns.huc.knaw.nl/text/TableMarker>


## Token

_Definition:_ A small unit of text when text is separated on whitespace, punctuation and numerals. Not necessarily carrying much meaning by itself. Not by definition equal to a word.  
_URI:_ <https://ns.huc.knaw.nl/text/Token>
_Related:_ <https://ns.huc.knaw.nl/text/Word>  


## Whitespace

_Definition:_ Empty parts of the text, i.e. gaps in text, may be either horizontal or vertical.  
_URI:_ <https://ns.huc.knaw.nl/text/Whitespace>
_Same as:_ <http://www.tei-c.org/ns/1.0#space>, <https://w3id.org/folia/v2/Whitespace>  


## Word

_Definition:_ A fundamental grammatical meaning-carrying item in text structure. Often embedded in a Sentence.  
_URI:_ <https://ns.huc.knaw.nl/text/Word>
_Same as:_ <https://w3id.org/folia/v2/Word>, <http://www.tei-c.org/ns/1.0#w>  
_Related:_ <https://ns.huc.knaw.nl/text/Token>  

