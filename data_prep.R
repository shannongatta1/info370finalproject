library(dplyr)

dems <- read.csv('./data/dem_candidates.csv', stringsAsFactors = FALSE)

# Retrieve months from election date
get_month <- function(date) {
  parts <- strsplit(date, '/') %>% unlist(.)
  return (parts[1])
}

dems$Election.Month <- lapply(dems$Race.Primary.Election.Date, get_month) %>% unlist(.)

# Fill NA's in endorsement columns, Party.Support, Gun.Sense.Candidate, No.Labels.Support 
# with "neutral"
endorsement_cols <- grep('.Endorsed', colnames(dems), value = TRUE)

fill_neutral <- function(row) {
  if (row == "") {
    return ('Netural')
  } else {
    return (row)
  }
}

for (col in endorsement_cols) {
  dems[[col]] <- lapply(dems[[col]], fill_neutral) %>% unlist(.)
}

dems$Party.Support. <- lapply(dems$Party.Support., fill_neutral) %>% unlist(.)
dems$Guns.Sense.Candidate. <- lapply(dems$Guns.Sense.Candidate., fill_neutral) %>% unlist(.)
dems$No.Labels.Support. <- lapply(dems$No.Labels.Support., fill_neutral) %>% unlist(.)

# Race, Veteran, LGBTQ, STEM, <- unknown
fill_unknown <- function(row) {
  if (row == "") {
    return ('Unknown')
  } else {
    return (row)
  }
}

unknown_cols <- c('Race', 'Veteran.', 'LGBTQ.', 'STEM.')
for (col in unknown_cols) {
  dems[[col]] <- lapply(dems[[col]], fill_unknown) %>% unlist(.)
}

# Obama.Alum, Elected.Official <- no
fill_no <- function(row) {
  if (row == "") {
    return ('No')
  } else {
    return (row)
  }
}

dems$Obama.Alum. <- lapply(dems$Obama.Alum., fill_no) %>% unlist(.)
dems$Elected.Official. <- lapply(dems$Elected.Official., fill_no) %>% unlist(.)

# Remove columns: N/A's, General.Status, Won.Primary, Race.Type, Partisan.Lean
dems$General.Status <- NULL
dems$Won.Primary <- NULL
dems$Race.Type <- NULL
dems$Partisan.Lean <- NULL
dems$Race.Primary.Election.Date <- NULL

# Export CSV
write.csv(dems, file = './data/dem_candidates_prepped', row.names = FALSE)
