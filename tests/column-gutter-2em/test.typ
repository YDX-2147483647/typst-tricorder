#import "/tests/common.typ": project, age-of-awakening-cast as names
#import "/src/lib.typ": tricorder

#show: project.with(page-width: 7 * 3em + 6 * 2em + 2 * 2em)

// TODO: 4-character names should only occupy one cell, if not at the end of a row. For fixed columns, a possible fix would be `grid.cell(inset: (right: -2em))`.
#tricorder(column-gutter: 2em, ..names)
