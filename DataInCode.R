# DataInCode
# Store (smaller) data objects in your R code - make your script fully reproducable yet easily sharable. 
# source("~/Github_repos/DataInCode/DataInCode.R")
# source("https://raw.githubusercontent.com/vertesy/DataInCode/master/DataInCode.R")
## RoxygenReady("~/Github_repos/DataInCode/DataInCode.R")



### Clipboard interaction -------------------------------------------------------------------------------------------------

toClipboard <- function(x, sep="\t", header=FALSE, row.names=FALSE, col.names =F) { # Copy an R-object to your clipboard on OS X.
  write.table(x, pipe("pbcopy"), sep=sep, row.names=row.names, col.names =col.names, quote = F)
}

fromClipboard <- function( sep="\t", header=F) { # Paste data from your clipboard (e.g. a table from Excel) into R, parse it to a code-snippet defining an R data frame on OS X.
  return (read.table(pipe("pbpaste"), sep=sep, header=header, stringsAsFactors =F))
}

fromClipboard.as_vec <- function( sep="\t", header=F) { # Paste a list of numbers from your clipboard (e.g. from Excel) into R, parse it to a code-snippet defining an R vector on OS X.
  return (as.vector(unlist(read.table(pipe("pbpaste"), sep=sep, header=header, stringsAsFactors =F))))
}

fromClipboard.as_num_vec <- function( sep="\t", header=F) { # Paste a list of strings from your clipboard (e.g. from Excel) into R, parse it to a numeric R vector on OS X.
  return (as.numeric(unlist(read.table(pipe("pbpaste"), sep=sep, header=header, stringsAsFactors =F))))
}

fromClipboard.as_named_vec <- function( sep="\t", header=F) { # Paste a list of strings from your clipboard (e.g. from Excel) into R, parse it to a numeric R vector on OS X.
  tbl = read.table(pipe("pbpaste"), sep=sep, header=header, stringsAsFactors =F)
  vecc = tbl[ ,2]
  names(vecc) = tbl[ ,1]
  print("Names should eb in column 1, data in column 2, no header row.")
  return (vecc)
}

### Paste variables into your code -------------------------------------------------------------------------------------------------

inline_vec.char <- function(char_vector) {	# Paste data into your code easily. Take a character vector, parse it to a code-snippet defining an R character vector, and copy back to the Clipboard.
  toClipboard(print(paste("c( '", paste (char_vector, collapse =  "', '"),  "')", collapse = "", sep=""), quote = F)); print(" Copied to Clipboard")
}

inline_vec.num <- function(num_vector) {	# Paste data into your code easily. Take a numeric vector, parse it to a code-snippet defining an R character vector, and copy back to the Clipboard.
  toClipboard(print(paste("c( ", paste (num_vector, collapse =  ", "),  " )", collapse = "", sep=""), quote = F)); print(" Copied to Clipboard")
}

inline_named_vec <- function(num_vector) {	# Paste data into your code easily. Take a numeric vector, parse it to a code-snippet defining an R character vector, and copy back to the Clipboard.
  toClipboard(    print(paste("c( ", paste (paste0('"', names(num_vector),'"'),"=", num_vector, collapse =  ", "),  " )", collapse = "", sep=""), quote = F)    )
  print(" Copied to Clipboard")
}

inline_list_char <- function(char_list) {	# Paste data into your code easily. Take a list of character vectors, parse it to a code-snippet defining an R list, and copy back to the Clipboard.
  print ("list(", quote = F)
  for (l in 1: length(list)) {
    print(paste("c( '", paste (char_list[[l]], collapse =  "', '"),  "')", collapse = "", sep=""), quote = F)
  };	print (")", quote = F)
}

inline_vec.char.from_Clipboard <- function() {	# Paste data into your code easily. Take a list of strings from your clipboard, parse it to a code-snippet defining an R character vector, and copy back to the Clipboard.
  toClipboard(print(paste("c( '", paste (fromClipboard.as_vec(), collapse =  "', '"),  "')", collapse = "", sep=""), quote = F)); print(" Copied from & to Clipboard")
}

inline_vec.num.from_Clipboard <- function() {	# Paste data into your code easily. Take a list of numbers from your clipboard, parse it to a code-snippet defining an R numeric vector, and copy back to the Clipboard.
  toClipboard(print(paste("c( ", paste (fromClipboard.as_num_vec(), collapse =  ", "),  " )", collapse = "", sep=""), quote = F)); print(" Copied from Clipboard")
}

oo <- function () {toClipboard(OutDir); print("OutDir is copied to the Clipbiard")}


### Plot from clipboard directly -------------------------------------------------------------------------------------------------
# require(MarkdownReports) # See: https://vertesy.github.io/MarkdownReports/

clhist <-function(..., breaks = 20, col = "gold1", xlb = "-") { # Draw a histogram from data pasted from clipboard. Works on OS X only.
  whist(fromClipboard.as_num_vec(),breaks = breakz, savefile = F)
}

clpie <-function(..., percentage = TRUE, both_pc_and_value = F, plotname = "Distribution" ) { #  Draw a pie chart from data pasted from clipboard.  Works on OS X only.
  wpie(fromClipboard.as_num_vec(), percentage = percentage, savefile = F)
}

clbarplot <-function( ..., col = "gold1", sub = F) { #  Draw a barplot from data pasted from clipboard.  Works on OS X only.
  wbarplot(fromClipboard.as_num_vec(), percentage = percentage, savefile = F)
}


