# DataInCode

Store (smaller) data objects in your R code - make your script fully reproducible  yet easily sharable. 

## Examples
### inline_named_vec

``` 
values = table(round(rnorm(100))); 

print(values)
# -2 -1  0  1  2 
#  8 21 37 28  6 

inline_named_vec(values)

 c( "-3" = 2, "-2" = 4, "-1" = 17, "0" = 46, "1" = 27, "2" = 3, "3" = 1 )

```


## Clipboard interaction functions for OS X
- toClipboard
- fromClipboard
- fromClipboard.as_vec
- fromClipboard.as_num_vec
- fromClipboard.as_named_vec

## Paste (small) data objects into your code
- inline_vec.char
- inline_vec.num
- inline_named_vec
- inline_list_char
- inline_vec.char.from_Clipboard
- inline_vec.num.from_Clipboard

## Create plots from directly clipboard
- clhist
- clpie
- clbarplot