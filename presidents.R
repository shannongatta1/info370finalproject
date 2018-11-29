# data from: https://www.uspresidentelection.us/

library(stringr)

election_year <- c()

year <- 2016
while (year != 1896) {
  election_year <- c(election_year, year)
  year <- year - 4
}

elected <- c('Donald Trump (R)', 'Barack Obama [D]', 'Barack Obama [D]', 'George W. Bush [R]', 'George W. Bush [R]',
             'William J. Clinton [D]', 'William J. Clinton [D]', 'George Bush [R]', 'Ronald Reagan [R]', 'Ronald Reagan [R]', 
             'Jimmy Carter [D]', 'Richard M. Nixon [R]', 'Richard M. Nixon [R]', 'Lyndon B. Johnson [D]', 'John F. Kennedy [D]',
            ' Dwight D. Eisenhower [R]', 'Dwight D. Eisenhower [R]', 'Harry S. Truman [D]', 'Franklin D. Roosevelt [D]',
             'Franklin D. Roosevelt [D]', 'Franklin D. Roosevelt [D]', 'Franklin D. Roosevelt [D]', 'Herbert C. Hoover [R]',
             'Calvin Coolidge [R]', 'Warren G. Harding [R]', 'Woodrow Wilson [D]', 'Woodrow Wilson [D]', 'William H. Taft [R]',	 
             'Theodore Roosevelt [R]', 'William McKinley [R]')

party <- c()
for (name in elected) {
  party <- c(party, (str_sub(name, -2, -2)))
}

elected <- lapply(elected, function(x) str_sub(x, 0, -5)) %>% unlist(.)

us_presidents <- data.frame(election_year, elected, party, stringsAsFactors=FALSE)