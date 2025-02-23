#import "/tests/common.typ": project, age-of-awakening as names
#import "/src/lib.typ": tricorder

#show: project.with(page-width: 40em)

#tricorder(column-gutter: 1.5em, ..names)
