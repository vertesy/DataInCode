# Function Overview
You find the list of function of this library below. For details, please browse the [source code](). <br>

## Clipboard interaction functions for OS X

### 1. toClipboard
- Copy an R-object to your clipboard on OS X.

### 2. fromClipboard
- Paste data from your clipboard (e.g. a table from Excel) into R, parse it to a code-snippet defining an R data frame on OS X.


### 3. fromClipboard.as_vec
- Paste a list of numbers from your clipboard (e.g. from Excel) into R, parse it to a code-snippet defining an R vector on OS X.


### 4. fromClipboard.as_num_vec
- Paste a list of strings from your clipboard (e.g. from Excel) into R, parse it to a numeric R vector on OS X.


### 5. fromClipboard.as_named_vec
- Paste a list of strings from your clipboard (e.g. from Excel) into R, parse it to a numeric R vector on OS X.

## Paste (small) data objects into your code

### 6. inline_vec.char
- Paste data into your code easily. Take a character vector, parse it to a code-snippet defining an R character vector, and copy back to the Clipboard.


### 7. inline_vec.num
- Paste data into your code easily. Take a numeric vector, parse it to a code-snippet defining an R character vector, and copy back to the Clipboard.


### 8. inline_named_vec
- Paste data into your code easily. Take a numeric vector, parse it to a code-snippet defining an R character vector, and copy back to the Clipboard.


### 9. inline_list_char
- Paste data into your code easily. Take a list of character vectors, parse it to a code-snippet defining an R list, and copy back to the Clipboard.


### 10. inline_vec.char.from_Clipboard
- Paste data into your code easily. Take a list of strings from your clipboard, parse it to a code-snippet defining an R character vector, and copy back to the Clipboard.


### 11. inline_vec.num.from_Clipboard
- Paste data into your code easily. Take a list of numbers from your clipboard, parse it to a code-snippet defining an R numeric vector, and copy back to the Clipboard.


### 12. oo
- oo <- function () {toClipboard(OutDir); print("OutDir is copied to the Clipbiard")}

## Create plots from directly clipboard

### 13. clhist
- Draw a histogram from data pasted from clipboard. Works on OS X only.


### 14. clpie
-  Draw a pie chart from data pasted from clipboard.  Works on OS X only.


### 15. clbarplot
-  Draw a barplot from data pasted from clipboard.  Works on OS X only.
