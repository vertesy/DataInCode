#### *Cite via:* [![DOI](https://zenodo.org/badge/64473225.svg)](https://zenodo.org/badge/latestdoi/64473225)

# DataInCode

Store (smaller) data objects in your R code - make your script fully reproducible yet easily sharable. Think of it as an extended version of `dput()`, where you can parse data objects into the code that generates them.

`DataInCode` also contains a set of clipboard interaction functions.



## Installation

Install directly from **GitHub** via **devtools** with one R command:

```r
# install.packages("devtools"); # If you don't have it.
require("devtools")
devtools::install_github(repo = "vertesy/DataInCode", ref = "main")
```

Alternatively, you simply source it from the web. 
*This way function help will not work, and you will have no local copy of the code on your hard drive.*

```r
source("https://raw.githubusercontent.com/vertesy/DataInCode/master/DataInCode/R/DataInCode.R")
```

Or, take [Download `DataInCode.R`](https://github.com/vertesy/DataInCode/blob/master/DataInCode.R), save as local `.R` file, and `source(~/path/to/DataInCode.R)`: 



## Usage
Simply load the package:

```r
require("DataInCode")
```

Or use command after `source("~/path/to/DataInCode.R")`.

```r
> MyVec = c(1:2, 'ava'); names(MyVec) =3:1
> MyVec2 = c(1:3)
> toClipboard(MyVec2)
> fromClipboard()
  V1
1  1
2  2
3  3
> fromClipboard.as_vec()
[1] "Length: 3"
[1] 1 2 3
> fromClipboard.as_num_vec()
[1] "Length: 3"
[1] 1 2 3
> # fromClipboard.as_named_vec()
> parse_vec(MyVec)
[1] "c( '1', '2', 'ava')"
> inline_vec.char(MyVec)
[1] c( '1', '2', 'ava')
[1] " Copied to Clipboard"
> inline_vec.num(MyVec)
[1] c( 1, 2, ava )
[1] " Copied to Clipboard"
> inline_named_vec(MyVec)
[1] c( "3" = 1, "2" = 2, "1" = ava )
[1] " Copied to Clipboard"
> inline_named_vec.char(MyVec)
[1] c( "3" = '1', "2" = '2', "1" = 'ava' )
[1] " Copied to Clipboard"
> inline_list_char(MyVec)
[1] list(
[1] c( '1')
[1] )
> inline_vec.char.from_Clipboard()
[1] "Length: 1"
[1] c( 'c( 3 = 1, 2 = 2, 1 = ava )')
[1] " Copied from & to Clipboard"
> toClipboard(MyVec2)
> inline_vec.num.from_Clipboard()
[1] "Length: 3"
[1] c( 1, 2, 3 )
[1] " Copied from Clipboard"
```



#### Example in detail

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



#### *Cite via:* [![DOI](https://zenodo.org/badge/64473225.svg)](https://zenodo.org/badge/latestdoi/64473225)

# 
