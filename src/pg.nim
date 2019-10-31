import strutils, sequtils, math, algorithm

proc is_white_space(s: string, i: int):bool =
  if s[i] == ' ' or s[i] == '\t':
    return true
  else:
    return false

proc is_colon(s: string, i: int):bool =
  return s[i] == ':'
  
var input = readAll(stdin)
var word:string
for i in 0..<len(input):
  # echo input[i], is_colon(input, i)
  echo input[i]
