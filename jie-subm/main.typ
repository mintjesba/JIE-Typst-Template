#import "jie-subm.typ": *

#show: doc => jie-subm(
  show-as-article: false,  // Change to true to get article-like output
  article-type: [
    [Article Type]
  ],
  title: [
    [Article Title]
  ],
  subtitle: [
    [Article Subtitle (optional)]
  ],
  authors: (
    [Author A], [Author B], [Author C], [Author D], [Author E]
  ),
  institutions: (
    [Department Name, Institution I, City, Country],
    [Department Name, Institution II, City, Country],
    [Department Name, Institution III, City, Country],
    [Department Name, Institution IV, City, Country],
    [Department Name, Institution V, City, Country],
  ),
  corresponding-author: [
    [Insert Corresponding Author information here. Include mailing address, email address and, if desired, website address.]
  ],
  conflict-of-interest-statement: [
    [Insert Conflict of Interest Statement here. If no conflict of interest exists, please use the wording, "The authors declare no conflict of interest."]
  ],
  data-availability-statement: [
    [Insert the relevant Data Availability Statement here. For sample statements, see http://jie.click/data-statements.]
  ],
  keywords: (
    [industrial ecology], [keyword 2], [keyword 3], [keyword 4], [keyword 5], [keyword 6 (max.)]
  ),
  abstract: [
    [Insert Abstract here, no more than 250 words.  Summarize research question, methods, findings and implications.  Do not use the abstract as an introduction.]
  ],
  doc,
)

= Introduction <sec:introduction>
[Insert Introduction text here]

= Methods <sec:methods>
[Insert Methods here. Please do not title this section “Materials and Methods” unless use of physical materials are part of the methodology.]

= Results <sec:results>
[Insert Results here. Please be sure to follow the JIE data accessibility requirements (#link("http://jie.click/dataacessibility")). Please insert tables formatted as Typst tables, not as embedded images.]

= Discussion <sec:discussion>
[Insert Discussion text here.]

= Acknowledgements <sec:acknowledgements>
[Insert Acknowledgments here.]

= Funding Information <sec:funding-information>
[Insert Funding Information here.]

= References <sec:references>
// Insert references in "refs.bib" file.
#bibliography("refs.bib", title: none, style: "apa")

= Supporting Information <sec:supporting-information>
#show-supp-inf(
  (
    [This supporting information describes ...],  // S1
    [This supporting information describes ...],   // S2
    // [Extra supporting information ...], // Add more if needed.
  )
)

// Figure legends are auto-generated from content above.