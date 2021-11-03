require("DataInCode")

MyVec = c(1:2, 'ava'); names(MyVec) =3:1
MyVec2 = c(1:3)

toClipboard(MyVec2)
fromClipboard()
fromClipboard.as_vec()
fromClipboard.as_num_vec()
# fromClipboard.as_named_vec()
parse_vec(MyVec)

inline_vec.char(MyVec)
inline_vec.num(MyVec)
inline_named_vec(MyVec)
inline_named_vec.char(MyVec)
inline_list_char(MyVec)
inline_vec.char.from_Clipboard()

toClipboard(MyVec2)
inline_vec.num.from_Clipboard()

# from_Clipboard.GeneNames2ID()
