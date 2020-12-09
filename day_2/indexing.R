# indexing

# prepare dataset
df <- mtcars
df$names <- row.names(mtcars)

# we can subset by index number
# let's find names 6 cylinder cars
ind <- which(df$cyl == 6)
df$names[ind]

# we can subset by logical vector
# find all car names with mpg > 20
ind <- df$mpg > 20
df$names[ind]

# % in %
n_cyl <- c(4, 6)
ind <- df$cyl %in% n_cyl
df$names[ind]

# which
ind <- which(df$cyl %in% n_cyl)
df$names[ind]
