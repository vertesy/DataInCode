# DataInCode
# Store (smaller) data objects in your R code - make your script fully reproducable yet easily sharable.
# source("~GitHub/Packages/DataInCode/DataInCode.R")
# source("https://raw.githubusercontent.com/vertesy/DataInCode/master/DataInCode.R")
## RoxygenReady("~GitHub/Packages/DataInCode/DataInCode.R")



### Clipboard interaction -------------------------------------------------------------------------------------------------

toClipboard <- function(x, sep="\t", header=FALSE, row.names=FALSE, col.names =F) { # Copy an R-object to your clipboard on OS X.
  write.table(x, pipe("pbcopy"), sep=sep, row.names=row.names, col.names =col.names, quote = F)
}

fromClipboard <- function( sep="\t", header=F) { # Paste data from your clipboard (e.g. a table from Excel) into R, parse it to a code-snippet defining an R data frame on OS X.
  return (read.table(pipe("pbpaste"), sep=sep, header=header, stringsAsFactors =F))
}

fromClipboard.as_vec <- function( sep="\t", header=F) { # Paste a list of numbers from your clipboard (e.g. from Excel) into R, parse it to a code-snippet defining an R vector on OS X.
  vec = as.vector(unlist(read.table(pipe("pbpaste"), sep=sep, header=header, stringsAsFactors =F)))
  print(paste("Length:", length(vec)))
  return (vec)
}

fromClipboard.as_num_vec <- function( sep="\t", header=F) { # Paste a list of strings from your clipboard (e.g. from Excel) into R, parse it to a numeric R vector on OS X.
  vec = as.numeric(unlist(read.table(pipe("pbpaste"), sep=sep, header=header, stringsAsFactors =F)))
  print(paste("Length:", length(vec)))
  return (vec)
}

fromClipboard.as_named_vec <- function( sep="\t", header=F) { # Paste a list of strings from your clipboard (e.g. from Excel) into R, parse it to a numeric R vector on OS X.
  tbl = read.table(pipe("pbpaste"), sep=sep, header=header, stringsAsFactors =F)
  vecc = tbl[ ,2]
  names(vecc) = tbl[ ,1]
  print("Names should eb in column 1, data in column 2, no header row.")
  print(paste("Length:", length(vecc)))
  return (vecc)
}

### Paste variables into your code -------------------------------------------------------------------------------------------------

parse_vec <- function(vector, numeric=F) {	# Serialize data. Take a character vector, parse it to a code-snippet defining an R character vector.
  if (numeric) { paste("c( ", paste (vector, collapse =  ", "),  " )", collapse = "", sep="")
  } else {       paste("c( '", paste (vector, collapse =  "', '"),  "')", collapse = "", sep="") }
}

inline_vec.char <- function(char_vector) {	# Paste data into your code easily. Take a character vector, parse it to a code-snippet defining an R character vector, and copy back to the Clipboard.
  toClipboard(print(parse_vec(char_vector, numeric = F), quote = F)); print(" Copied to Clipboard")
}

inline_vec.num <- function(num_vector) {	# Paste data into your code easily. Take a numeric vector, parse it to a code-snippet defining an R character vector, and copy back to the Clipboard.
  toClipboard(print(parse_vec(num_vector, numeric = T), quote = F)); print(" Copied to Clipboard")
}

inline_named_vec <- function(num_vector) {	# Paste data into your code easily. Take a numeric vector, parse it to a code-snippet defining an R character vector, and copy back to the Clipboard.
  toClipboard(    print(paste("c( ", paste (paste0('"', names(num_vector),'"'),"=", num_vector, collapse =  ", "),  " )", collapse = "", sep=""), quote = F)    )
  print(" Copied to Clipboard")
}

inline_named_vec.char <- function(num_vector) {	# Take a character vector, parse it to a code-snippet defining an R character vector, and copy back to the Clipboard.
  toClipboard(    print(p0("c( ", paste0 (paste0('"', names(num_vector),'"')," = '", num_vector, collapse =  "', "),  "' )", collapse = "", sep=""), quote = F)    )
  print(" Copied to Clipboard")
}

inline_list_char <- function(char_list) {	# Paste data into your code easily. Take a list of character vectors, parse it to a code-snippet defining an R list, and copy back to the Clipboard.
  print ("list(", quote = F)
  for (l in 1: length(list)) {
    print(paste("c( '", paste (char_list[[l]], collapse =  "', '"),  "')", collapse = "", sep=""), quote = F)
  };	print (")", quote = F)
}

inline_vec.char.from_Clipboard <- function() {	# Paste data into your code easily. Take a list of strings from your clipboard, parse it to a code-snippet defining an R character vector, and copy back to the Clipboard.
  toClipboard(print(parse_vec(fromClipboard.as_vec(), numeric = F), quote = F));  print(" Copied from & to Clipboard")
}

inline_vec.num.from_Clipboard <- function() {	# Paste data into your code easily. Take a list of numbers from your clipboard, parse it to a code-snippet defining an R numeric vector, and copy back to the Clipboard.
  toClipboard(print(parse_vec(fromClipboard.as_num_vec(), numeric = T), quote = F)); print(" Copied from Clipboard")
}

oo <- function () {toClipboard(OutDir); print("OutDir is copied to the Clipboard")}

from_Clipboard.GeneNames2ID <- function() {	# Copy genes
  XXX=fromClipboard.as_vec(); inline_vec.char(name2id(trimws(XXX)));  print(" Copied from & to Clipboard")
}





