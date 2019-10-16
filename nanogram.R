library(devtools)
# devtools::install_github("coolbutuseless/nonogram")
library(nonogram)
library(magick)

# Imports the image
im <- magick::image_read("phantom.png")
# Make it grayscale and shrink it
im <- im %>% 
  image_quantize(max=2, colorspace = 'gray', dither=TRUE) %>%
  image_scale(geometry = geometry_size_pixels(width=25, height=20, preserve_aspect=FALSE))

# Convert to matrix
mat <- t(1L - 1L * (im[[1]][1,,] > 180))

# Creates string with the cells that have to be highlighted and the clues
puzzle  <- create_puzzle_from_matrix(mat)
puzzle_string <- convert_puzzle_to_puzzle_string(puzzle)

# Creates blank plot with the clues
create_puzzle_plot(puzzle, show_clues=TRUE)

# create_puzzle_plot(puzzle, mat, show_clues=TRUE)
