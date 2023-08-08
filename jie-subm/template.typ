// TYPST TEMPLATE FOR JOURNAL OF INDUSTRIAL ECOLOGY SUBMISSIONS
// Made by: Berend Mintjes, CML, Leiden University, the Netherlands
// Last updated: 07-08-2023

#let jie-subm(
  show-as-manuscript: true,
  article-type: none,
  title: none,
  subtitle: none,
  authors: (),
  institutions: (),
  corresponding-author: none,
  conflict-of-interest-statement: none,
  data-availability-statement: none,
  keywords: (),
  abstract: none,
  doc
) = {
  show cite: ct => [
    #set text(fill: rgb("#00008B"))
    #ct
  ]
  
  if show-as-manuscript {
  // Formatted as manuscript:
    set page(
      paper: "us-letter",
      numbering: none
    )
    
    set text(
      font: "Liberation Serif",
      size: 12pt,
    )
  
    set math.equation(
      numbering: "(1)"
    )
  
    show link: lk => [
      #set text(fill: blue)
      #underline(lk)]
  
    set heading(
      numbering: "1.1."
    )
    
    show heading.where(
      level: 1
    ): it => [
      #set text(weight: "bold", style: "normal", size: 12pt)
      #v(12pt) #upper(it)
    ]
    show heading: it => [
      #set text(style: "italic", weight: "regular", size: 12pt)
      #it
    ]
  
    show figure: fig => [
      #v(12pt)
      *[Figure #locate(loc => {counter(figure).display()}) close to here.]*
      #v(12pt)
    ]
    
    v(24pt)
    [*Article Type:* #article-type]
    v(24pt)
    [*Title:* #title#if subtitle != none [\- #subtitle]]
    v(24pt)
    [*Authors:* 
    
      #h(1.2cm)
      #for idx in range(authors.len() - 1) [
          #authors.at(idx),#super(str(idx+1)) 
        ]
      #if authors.len() > 0 [#authors.last()#super(str(authors.len()))]
    ]
    v(24pt)
    [*Institutions:*
    
        #for (idx, ins) in institutions.enumerate() [
          #h(1.2cm)#super(str(idx + 1)) #ins \
        ]
    ]
    v(24pt)
    [*Corresponding Author:* #corresponding-author]
    v(24pt)
    [*Conflict of Interest Statement:* #conflict-of-interest-statement]
    v(24pt)
    [*Data Availability Statement:* #data-availability-statement]
    v(24pt)
    [*Keywords:* #for idx in range(keywords.len() - 1) [
          #keywords.at(idx), 
        ]
        #if keywords.len() > 0 [#keywords.last().]
    ]
    v(24pt)
    [*Abstract:* #abstract]
    
    doc
  
    [
      #v(24pt)
      *Figure Legends*\
      #locate(loc => {
      let elems = query(selector(figure).before(loc), loc)
      for (idx, fig) in elems.enumerate() [
        Figure #str(idx + 1): #fig.caption \
        ]
      })
    ]
  
} else {
  set page(
    paper: "a4",
    margin: 1.5cm
  )
  
  // Formatting as article (not as manuscript)
  set text(
    font: "Noto Sans",
    size: 9pt
  )

  set heading(
    numbering: "1.1 ∣"
  )

  show heading.where(
    level: 1
  ): hd => [#v(11pt) #text(upper(hd), size: 11pt) #v(11pt)]

  show <sec:acknowledgements>: hd => [#v(10pt) #text(upper(hd.body), size:10pt, weight: "semibold", font: "DM Sans")

  ]
  
  show <sec:funding-information>: hd => [#v(10pt) #text(upper(hd.body), size:10pt, weight: "semibold", font: "DM Sans")

  ]
  
  show <sec:references>: hd => [#v(10pt) #text(upper(hd.body), size:10pt, weight: "semibold", font: "DM Sans")

  ]
  
  show <sec:supporting-information>: hd => [#v(10pt) #text(upper(hd.body), size:10pt, weight: "semibold", font: "DM Sans")

  ]

  
  [
    #upper(underline(text(
      article-type,
      weight: "bold",
      tracking: 2pt
    ), offset:5pt, stroke:1.5pt))//
  ]
  v(30pt)
  [
    #text(title, size: 25pt, weight: "bold")
    #v(-5pt)
    #text(subtitle, size: 20pt, weight: "bold", fill: rgb("#5A5A5A"))
  ]
  v(10pt)
  [
    #set text(weight: "bold", size: 15pt)
    #for idx in range(authors.len() - 1) [
      #authors.at(idx)#super(str(idx + 1)) |
    ]
    #authors.last()#super(str(authors.len()))
  ]

  [
    #grid(
      columns: (25%, 75%),
      rows: auto,
      [
        #set text(size: 8pt)
        #for (idx, ins) in institutions.enumerate() [
          #super(str(idx + 1)) #ins \
        ]],
      rect(
        inset: 8pt,
        fill: rgb("e4e5ea"),
        width: 100%,
      )[
        *Abstract*\
        #set text(size:10pt)
        #abstract
        #v(5pt)
        #text(upper("keywords"), weight: "bold", size:9pt, tracking: 1pt)\
        #set text(size: 9pt)
        #for idx in range(keywords.len() - 1) [
          #keywords.at(idx), 
        ] #keywords.last()
      ]
    )
  ]
  
  doc
  
  
}
}
    

#let show-supp-inf(supp-inf) = {
  align(center, box(
    width: 95%,
    stroke: black,
    inset: 10pt,
    align(left, 
    text(size: 11pt, [
      *Supporting Information*

      Supporting information is linked to this article on the JIE website:

      #for (idx, descr) in supp-inf.enumerate() [
        *Supporting Information S#str(idx + 1)*: #descr 
        
      ]
      
    ]))
  ))
}