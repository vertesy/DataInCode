# DataInCode

Store (smaller) data objects in your R code - make your script fully reproducible yet easily sharable. Think of it as an extended version of `dput()`, where you can parse data objects into the code that generates them.

`DataInCode` also contains a set of clipboard interaction functions.

## Installation

1.) [Download `DataInCode.R`](https://github.com/vertesy/DataInCode/blob/master/DataInCode.R), save as local `.R` file, and `source(~/path/to/DataInCode.R)`: 

2.) Directly source from the web:
```R
source("https://raw.githubusercontent.com/vertesy/DataInCode/master/DataInCode.R")
```

## Usage
After `source("~/path/to/DataInCode.R")`  you can use any of the functions listed below. 

### Examples

#### `inline_named_vec()`

``` R
values = table(round(rnorm(100))); 

print(values)
-2 -1  0  1  2  3 
11 22 39 23  4  1 

inline_named_vec(values)

 c( "-2" = 11, "-1" = 22, "0" = 39, "1" = 23, "2" = 4, "3" = 1 )
```


## Clipboard interaction functions for OS X

- `toClipboard()`
- `fromClipboard()`
- `fromClipboard.as_vec()`
- `fromClipboard.as_num_vec()`
- `fromClipboard.as_named_vec()`

## Paste (small) data objects into your code
- `inline_vec.char()`
- `inline_vec.num()`
- `inline_named_vec()`
- `inline_list_char()`
- `inline_vec.char.from_Clipboard()`
- `inline_vec.num.from_Clipboard()`

## Create plots from directly clipboard
- `clhist()`
- `clpie()`
- `clbarplot()`
