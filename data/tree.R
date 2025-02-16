library(collapsibleTree)
library(readxl)
gb <- read.csv("tree.csv")
collapsibleTree(gb, c("lv1", "lv2", "lv3"), collapsed = TRUE, zoomable=TRUE, width=500)


# Tooltip can be mapped to an attribute, or default to leafCount
collapsibleTree(
  warpbreaks, c("wool", "tension", "breaks"),
  tooltip = FALSE,
  attribute = "breaks"
)

# Create a simple org chart
org <- data.frame(
  Manager = c(
    NA, "Ana", "Ana", "Bill", "Bill", "Bill", "Claudette", "Claudette", "Danny",
    "Fred", "Fred", "Grace", "Larry", "Larry", "Nicholas", "Nicholas"
  ),
  Employee = c(
    "Ana", "Bill", "Larry", "Claudette", "Danny", "Erika", "Fred", "Grace",
    "Henri", "Ida", "Joaquin", "Kate", "Mindy", "Nicholas", "Odette", "Peter"
  ),
  Title = c(
    "President", "VP Operations", "VP Finance", "Director", "Director", "Scientist",
    "Manager", "Manager", "Jr Scientist", "Operator", "Operator", "Associate",
    "Analyst", "Director", "Accountant", "Accountant"
  )
)

# Add in colors and sizes
org$Color <- org$Title
levels(org$Color) <- colorspace::rainbow_hcl(11)

# Use unsplash api to add in random photos to tooltip
org$tooltip <- paste0(
  org$Employee,
  "<br>Title: ",
  org$Title,
  "<br><img src='https://source.unsplash.com/collection/385548/150x100'>"
)

collapsibleTreeNetwork(
  org,
  attribute = "Title",
  fill = "Color",
  nodeSize = "leafCount",
  tooltipHtml = "tooltip"
)
