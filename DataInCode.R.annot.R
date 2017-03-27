## DataInCode.R - compiled by RoxygenReady, a package by @vertesy


#' toClipboard 
#' 
#' Copy an R-object to your clipboard on OS X.
#' @param x 
#' @param sep 
#' @param header 
#' @param row.names 
#' @param col.names 
#' @examples toClipboard (x =  , sep = 	, header = FALSE, row.names = FALSE, col.names = F)
#' @export 

toClipboard <-function (x, sep = "\t", header = FALSE, row.names = FALSE, col.names = F) {
	write.table(x, pipe("pbcopy"), sep = sep, row.names = row.names, col.names = col.names, quote = F)
}


#' fromClipboard 
#' 
#' Paste data from your clipboard (e.g. a table from Excel) into R, parse it to a code-snippet defining an R data frame on OS X.
#' @param sep 
#' @param header 
#' @examples fromClipboard (sep = 	, header = F)
#' @export 

fromClipboard <-function (sep = "\t", header = F) {
	return(read.table(pipe("pbpaste"), sep = sep, header = header, stringsAsFactors = F))
}


#' fromClipboard.as_vec 
#' 
#' Paste a list of numbers from your clipboard (e.g. from Excel) into R, parse it to a code-snippet defining an R vector on OS X.
#' @param sep 
#' @param header 
#' @examples fromClipboard.as_vec (sep = 	, header = F)
#' @export 

fromClipboard.as_vec <-function (sep = "\t", header = F) {
	return(as.vector(unlist(read.table(pipe("pbpaste"), sep = sep, header = header, stringsAsFactors = F))))
}


#' fromClipboard.as_num_vec 
#' 
#' Paste a list of strings from your clipboard (e.g. from Excel) into R, parse it to a numeric R vector on OS X.
#' @param sep 
#' @param header 
#' @examples fromClipboard.as_num_vec (sep = 	, header = F)
#' @export 

fromClipboard.as_num_vec <-function (sep = "\t", header = F) {
	return(as.numeric(unlist(read.table(pipe("pbpaste"), sep = sep, header = header, stringsAsFactors = F))))
}


#' fromClipboard.as_named_vec 
#' 
#' Paste a list of strings from your clipboard (e.g. from Excel) into R, parse it to a numeric R vector on OS X.
#' @param sep 
#' @param header 
#' @examples fromClipboard.as_named_vec (sep = 	, header = F)
#' @export 

fromClipboard.as_named_vec <-function (sep = "\t", header = F) {
	tbl = read.table(pipe("pbpaste"), sep = sep, header = header, stringsAsFactors = F)
	vecc = tbl[, 2]
	names(vecc) = tbl[, 1]
	print("Names should eb in column 1, data in column 2, no header row.")
	return(vecc)
}


#' inline_vec.char 
#' 
#' Paste data into your code easily. Take a character vector, parse it to a code-snippet defining an R character vector, and copy back to the Clipboard.
#' @param char_vector 
#' @examples inline_vec.char (char_vector =  )
#' @export 

inline_vec.char <-function (char_vector) {
	toClipboard(print(paste("c( '", paste(char_vector, collapse = "', '"), "')", collapse = "", sep = ""), 
		quote = F))
	print(" Copied to Clipboard")
}


#' inline_vec.num 
#' 
#' Paste data into your code easily. Take a numeric vector, parse it to a code-snippet defining an R character vector, and copy back to the Clipboard.
#' @param num_vector 
#' @examples inline_vec.num (num_vector =  )
#' @export 

inline_vec.num <-function (num_vector) {
	toClipboard(print(paste("c( ", paste(num_vector, collapse = ", "), " )", collapse = "", sep = ""), 
		quote = F))
	print(" Copied to Clipboard")
}


#' inline_named_vec 
#' 
#' Paste data into your code easily. Take a numeric vector, parse it to a code-snippet defining an R character vector, and copy back to the Clipboard.
#' @param num_vector 
#' @examples inline_named_vec (num_vector =  )
#' @export 

inline_named_vec <-function (num_vector) {
	toClipboard(print(paste("c( ", paste(paste0("\"", names(num_vector), "\""), "=", num_vector, collapse = ", "), 
		" )", collapse = "", sep = ""), quote = F))
	print(" Copied to Clipboard")
}


#' inline_list_char 
#' 
#' Paste data into your code easily. Take a list of character vectors, parse it to a code-snippet defining an R list, and copy back to the Clipboard.
#' @param char_list 
#' @examples inline_list_char (char_list =  )
#' @export 

inline_list_char <-function (char_list) {
	print("list(", quote = F)
	for (l in 1:length(list)) {
		print(paste("c( '", paste(char_list[[l]], collapse = "', '"), "')", collapse = "", sep = ""), 
			quote = F)
	}
	print(")", quote = F)
}


#' inline_vec.char.from_Clipboard 
#' 
#' @param  
#' @examples inline_vec.char.from_Clipboard ()
#' @export 

inline_vec.char.from_Clipboard <-function () {
	toClipboard(print(paste("c( '", paste(fromClipboard.as_vec(), collapse = "', '"), "')", collapse = "", 
		sep = ""), quote = F))
	print(" Copied from & to Clipboard")
}


#' inline_vec.num.from_Clipboard 
#' 
#' @param  
#' @examples inline_vec.num.from_Clipboard ()
#' @export 

inline_vec.num.from_Clipboard <-function () {
	toClipboard(print(paste("c( ", paste(fromClipboard.as_num_vec(), collapse = ", "), " )", collapse = "", 
		sep = ""), quote = F))
	print(" Copied from Clipboard")
}


#' oo 
#' 
#' @param  
#' @examples oo ()
#' @export 

oo <-function () {
	toClipboard(OutDir)
	print("OutDir is copied to the Clipbiard")
}


#' clhist 
#' 
#' Draw a histogram from data pasted from clipboard. Works on OS X only.
#' @param ... 
#' @param breaks 
#' @param col 
#' @param xlb 
#' @examples clhist (... =  , breaks = 20, col = gold1, xlb = -)
#' @export 

clhist <-function (..., breaks = 20, col = "gold1", xlb = "-") {
	whist(fromClipboard.as_num_vec(), breaks = breakz, savefile = F)
}


#' clpie 
#' 
#'  Draw a pie chart from data pasted from clipboard.  Works on OS X only.
#' @param ... 
#' @param percentage 
#' @param both_pc_and_value 
#' @param plotname 
#' @examples clpie (... =  , percentage = TRUE, both_pc_and_value = F, plotname = Distribution)
#' @export 

clpie <-function (..., percentage = TRUE, both_pc_and_value = F, plotname = "Distribution") {
	wpie(fromClipboard.as_num_vec(), percentage = percentage, savefile = F)
}


#' clbarplot 
#' 
#'  Draw a barplot from data pasted from clipboard.  Works on OS X only.
#' @param ... 
#' @param col 
#' @param sub 
#' @examples clbarplot (... =  , col = gold1, sub = F)
#' @export 

clbarplot <-function (..., col = "gold1", sub = F) {
	wbarplot(fromClipboard.as_num_vec(), percentage = percentage, savefile = F)
}


