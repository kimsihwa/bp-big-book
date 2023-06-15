# Read in the YAML file
y <- yaml::read_yaml("_quarto.yml")

# Get the list of files
paths <- y$book$chapters |>
    unlist() |>
    unname()

# Identify the files that don't exist
files <- paths[!fs::file_exists(paths)]

# Touch the files
files |> purrr::walk(~ fs::file_create(.x))
