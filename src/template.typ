// The project function defines how your document looks.
// It takes your content and some metadata and formats it.
// Go ahead and customize it to your liking!
#let project(title: "", objective: [], authors: (), body) = {

 // Set the document's author and title
  set document(author: authors, title: title)

  // Configure the page settings including paper size, margins, numbering, and header
  set page(paper: "a4", margin: (top: 100pt),
  numbering: "— 1/1 —", number-align: center,
  header: stack(dir: ltr,
  image("media/logo-ENSEA.jpg", width: 10%),
  align(right)[*#title* #linebreak() #authors.map(strong).join(", ", last: " et ") #linebreak() Promotion 2025]))

  // Set the text font, size, language, and region
  set text(font: "New Computer Modern", size: 12pt, lang: "en", region: "gb")
/* for French => lang: "fr" and region: "fr"
  for other countries:
  lang: https://en.wikipedia.org/wiki/ISO_639
  region: https://en.wikipedia.org/wiki/ISO_3166-1_alpha-2 */

  // Set paragraph justification
  set par(justify: true)

  // Configure heading numbering and spacing
  set heading(numbering: "1.1.")
  show heading: set block(spacing: 1em)

  // Set list indentation and marker style
  set list(indent: 15pt, marker: [--])

  // Configure math equation numbering and supplement
  set math.equation(numbering: "(1)", supplement: [Eq.])

  // Style figure captions to be italicized
  show figure.caption: emph
  // Align figure captions based on their width
  show figure.caption: it => {
  layout(size => [
    #let text-size = measure(it.supplement + it.separator + it.body)
    #let my-align
    #if text-size.width < size.width {
      my-align = center
    } else {
      my-align = left
    }
    #align(my-align, it)
  ])
}

    // Disable paragraph justification for raw blocks eg. codelst package
    show raw.where(block: true): set par(justify: false)

  // Center align the title block
  align(center)[
    #block(text(weight: 700, 1.75em, title))
  ]
  linebreak()

  heading(outlined: false, numbering: none, text(0.85em, smallcaps[objectives]))

  objective
  body
}