# DataInCode
# Store (smaller) data objects in your R code - make your script fully reproducable yet easily sharable.
# source("~GitHub/Packages/DataInCode/DataInCode.R")
# source("https://raw.githubusercontent.com/vertesy/DataInCode/master/DataInCode.R")



### Clipboard interaction -------------------------------------------------------------------------------------------------

#' @title toClipboard
#' @description Copy an R-object to your clipboard on OS X.
#' @param x PARAM_DESCRIPTION
#' @param sep PARAM_DESCRIPTION, Default: '	'
#' @param header PARAM_DESCRIPTION, Default: FALSE
#' @param row.names PARAM_DESCRIPTION, Default: FALSE
#' @param col.names PARAM_DESCRIPTION, Default: F
#' @export

toClipboard <- function(x, sep="\t", header=FALSE, row.names=FALSE, col.names =F) { # Copy an R-object to your clipboard on OS X.
  write.table(x, pipe("pbcopy"), sep=sep, row.names=row.names, col.names =col.names, quote = F)
}

#' @title fromClipboard
#' @description Paste data from your clipboard (e.g. a table from Excel) into R, parse it to a code-snippet defining an R data frame on OS X.
#' @param sep PARAM_DESCRIPTION, Default: '	'
#' @param header PARAM_DESCRIPTION, Default: F
#' @export
fromClipboard <- function( sep="\t", header=F) { # Paste data from your clipboard (e.g. a table from Excel) into R, parse it to a code-snippet defining an R data frame on OS X.
  return (read.table(pipe("pbpaste"), sep=sep, header=header, stringsAsFactors =F))
}

#' @title fromClipboard.as_vec
#' @description Paste a list of numbers from your clipboard (e.g. from Excel) into R, parse it to a code-snippet defining an R vector on OS X.
#' @param sep PARAM_DESCRIPTION, Default: '	'
#' @param header PARAM_DESCRIPTION, Default: F
#' @export
fromClipboard.as_vec <- function( sep="\t", header=F) { # Paste a list of numbers from your clipboard (e.g. from Excel) into R, parse it to a code-snippet defining an R vector on OS X.
  vec = as.vector(unlist(read.table(pipe("pbpaste"), sep=sep, header=header, stringsAsFactors =F)))
  print(paste("Length:", length(vec)))
  return (vec)
}

#' @title fromClipboard.as_num_vec
#' @description Paste a list of strings from your clipboard (e.g. from Excel) into R, parse it to a numeric R vector on OS X.
#' @param sep PARAM_DESCRIPTION, Default: '	'
#' @param header PARAM_DESCRIPTION, Default: F
#' @export
fromClipboard.as_num_vec <- function( sep="\t", header=F) { # Paste a list of strings from your clipboard (e.g. from Excel) into R, parse it to a numeric R vector on OS X.
  vec = as.numeric(unlist(read.table(pipe("pbpaste"), sep=sep, header=header, stringsAsFactors =F)))
  print(paste("Length:", length(vec)))
  return (vec)
}

#' @title fromClipboard.as_named_vec
#' @description Paste a list of strings from your clipboard (e.g. from Excel) into R, parse it to a numeric R vector on OS X.
#' @param sep PARAM_DESCRIPTION, Default: '	'
#' @param header PARAM_DESCRIPTION, Default: F
#' @export
fromClipboard.as_named_vec <- function( sep="\t", header=F) { # Paste a list of strings from your clipboard (e.g. from Excel) into R, parse it to a numeric R vector on OS X.
  tbl = read.table(pipe("pbpaste"), sep=sep, header=header, stringsAsFactors =F)
  vecc = tbl[ ,2]
  names(vecc) = tbl[ ,1]
  print("Names should eb in column 1, data in column 2, no header row.")
  print(paste("Length:", length(vecc)))
  return (vecc)
}

### Paste variables into your code -------------------------------------------------------------------------------------------------

#' @title parse_vec
#' @description Serialize data. Take a character vector, parse it to a code-snippet defining an R character vector.
#' @param vector PARAM_DESCRIPTION
#' @param numeric PARAM_DESCRIPTION, Default: F
#' @export
parse_vec <- function(vector, numeric=F) {	# Serialize data. Take a character vector, parse it to a code-snippet defining an R character vector.
  if (numeric) { paste("c( ", paste (vector, collapse =  ", "),  " )", collapse = "", sep="")
  } else {       paste("c( '", paste (vector, collapse =  "', '"),  "')", collapse = "", sep="") }
}

#' @title inline_vec.char
#' @description Paste data into your code easily. Take a character vector, parse it to a code-snippet defining an R character vector, and copy back to the Clipboard.
#' @param char_vector PARAM_DESCRIPTION
#' @export
inline_vec.char <- function(char_vector) {	# Paste data into your code easily. Take a character vector, parse it to a code-snippet defining an R character vector, and copy back to the Clipboard.
  toClipboard(print(parse_vec(char_vector, numeric = F), quote = F)); print(" Copied to Clipboard")
}

#' @title inline_vec.num
#' @description Paste data into your code easily. Take a numeric vector, parse it to a code-snippet defining an R character vector, and copy back to the Clipboard.
#' @param num_vector PARAM_DESCRIPTION
#' @export
inline_vec.num <- function(num_vector) {	# Paste data into your code easily. Take a numeric vector, parse it to a code-snippet defining an R character vector, and copy back to the Clipboard.
  toClipboard(print(parse_vec(num_vector, numeric = T), quote = F)); print(" Copied to Clipboard")
}

#' @title inline_named_vec
#' @description Paste data into your code easily. Take a numeric vector, parse it to a code-snippet defining an R character vector, and copy back to the Clipboard.
#' @param num_vector PARAM_DESCRIPTION
#' @export
inline_named_vec <- function(num_vector) {	# Paste data into your code easily. Take a numeric vector, parse it to a code-snippet defining an R character vector, and copy back to the Clipboard.
  toClipboard(    print(paste("c( ", paste (paste0('"', names(num_vector),'"'),"=", num_vector, collapse =  ", "),  " )", collapse = "", sep=""), quote = F)    )
  print(" Copied to Clipboard")
}

#' @title inline_named_vec.char
#' @description Take a character vector, parse it to a code-snippet defining an R character vector, and copy back to the Clipboard.
#' @param num_vector PARAM_DESCRIPTION
#' @export
inline_named_vec.char <- function(num_vector) {	# Take a character vector, parse it to a code-snippet defining an R character vector, and copy back to the Clipboard.
  toClipboard(    print(p0("c( ", paste0 (paste0('"', names(num_vector),'"')," = '", num_vector, collapse =  "', "),  "' )", collapse = "", sep=""), quote = F)    )
  print(" Copied to Clipboard")
}

#' @title inline_list_char
#' @description Paste data into your code easily. Take a list of character vectors, parse it to a code-snippet defining an R list, and copy back to the Clipboard.
#' @param char_list PARAM_DESCRIPTION
#' @export
inline_list_char <- function(char_list) {	# Paste data into your code easily. Take a list of character vectors, parse it to a code-snippet defining an R list, and copy back to the Clipboard.
  print ("list(", quote = F)
  for (l in 1: length(list)) {
    print(paste("c( '", paste (char_list[[l]], collapse =  "', '"),  "')", collapse = "", sep=""), quote = F)
  };	print (")", quote = F)
}

#' @title inline_vec.char.from_Clipboard
#' @description Paste data into your code easily. Take a list of strings from your clipboard, parse it to a code-snippet defining an R character vector, and copy back to the Clipboard.
#' @export
inline_vec.char.from_Clipboard <- function() {	# Paste data into your code easily. Take a list of strings from your clipboard, parse it to a code-snippet defining an R character vector, and copy back to the Clipboard.
  toClipboard(print(parse_vec(fromClipboard.as_vec(), numeric = F), quote = F));  print(" Copied from & to Clipboard")
}

#' @title inline_vec.num.from_Clipboard
#' @description Paste data into your code easily. Take a list of numbers from your clipboard, parse it to a code-snippet defining an R numeric vector, and copy back to the Clipboard.
#' @export
inline_vec.num.from_Clipboard <- function() {	# Paste data into your code easily. Take a list of numbers from your clipboard, parse it to a code-snippet defining an R numeric vector, and copy back to the Clipboard.
  toClipboard(print(parse_vec(fromClipboard.as_num_vec(), numeric = T), quote = F)); print(" Copied from Clipboard")
}

#' @title from_Clipboard.GeneNames2ID
#' @description Copy genes
#' @export
from_Clipboard.GeneNames2ID <- function() {	# Copy genes
  XXX=fromClipboard.as_vec(); inline_vec.char(name2id(trimws(XXX)));  print(" Copied from & to Clipboard")
}





