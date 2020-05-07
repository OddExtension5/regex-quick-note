#!/bin/bash

# find text in a file
grep zero /basic/words.txt
grep Hello *
grep 'hello' words.txt

# changes the contents of a file
sed -i 's/zero/ZERO/' words.txt
sed -i 's/ZER0/zero/' words.txt
sed -i 's/hello/goodbye/g' msg.txt
sed -i 's/hello/goodbye/g' ~/dir/*

# Examples of Complex regexs
/(?x) , [^,] ++ /
/(?<=\.) {2,}(?=[A-Z])/
/\(?\d{3}[ \-.\)]*\d{3}[ \-.]?\d{4}/
/(?x) (?: https? | ftp) :// ([^/]+) (/.*)? /
s/(?<=\d)(?=(\d\d\d)+(?!\d))/,/g
/(?xi) ^ [\w+-]+ (?: \. [\w.+-]+ )* @ [a-z0-9-]+ (?: \. [a-z0-9-]+ )* $ /

# Regex Flavours
## 6 major dialects of regexes
  # BRE - Base Regular Expressions (grep)
  # ERE - Extended Regular Expressions (egrep)
  # Emacs
  # ViM
  # PCRE - Perl Compatible Regular Expression (Python, Javascript) (grep - P)
  # Perl6

# difference between grep and egrep
grep 'zero|Zero' words.txt  # this will not work
grep 'zero\|Zero' words.txt # this will work, because we removed the special meaning of `|`

egrep 'zero|Zero' words.txt # this will work , no need to remove special meaning

  # grep uses the BRE dialect
  # egrep uses the ERE dialect
  # egrep is equivalent to grep -E
  # grep -P uses PCRE 
      # it has the most features
      # it is supported by JavaScript and Python
  

# Basic Syntax Topics
  # Basic regular expressions - normal characters and .
  # Beginning and ending of the line - ^ and $
  # .  - matches any character except \n
  # ^ - match the beginning of the string
  # $ - match the end of the string (or right before newline at the end of the string)
  # To match special characters, they must be escaped with the backslash


grep a file.txt     # match "a" anywhere in the string (line of the file)
grep abc file.txt   # match "a" followed by "b" followed by "c" anywehre in the string
grep ab12 file.txt  # match "a" followed by "b" followed by "1" followed by "2" anywehre in the string
grep a.b file.txt   # match "a" followed by any character but \n followed by "b", anywehre in the string
grep a.b.c file.txt # match "a" followed by any character but \n followed by "b" followed by any character but \n followed by "c", anywhere in the string
grep ^abc file.txt  # match "abc" at the beginning of the string
grep abc$ file.txt  # match "abc" at the end of the string (or "abc\n" at end of the string)
grep ^abc$ file.txt # match the string "abc" (also matches "abc\n")
grep a\.b\.c file.txt
grep ^\^\$$ file.txt

grep -P n /basic/words.txt
grep -P ne /basic/words.txt
grep -P r /basic/words.txt
grep -P r$ /basic/words.txt
grep -P y /basic/words.txt

# Regex "Statements"
  # /^abc$/
  # if "a' at the beginning of the string
  # and the if "b"
  # and then if "c" at the end of the string
  # then MATCH

 ## regex as a state machine
   # -->| BoS |-->| a |-->| c |-->| EoS |--> MATCH

# Regex Engine Basics

• start at left of regex
• start at left of string
• try all possible paths
• backtrack as little as possible
• if MATCH, stop - SUCCESS
• if FAIL, move along one character in string, start over at the beginning of the regex, and try all possible paths again
• if FAIL starting at every character - FAIL

#### Regex Rule #1
The earliest match wins

## Exercise 1:
  ## In the /basic directory is a file words.txt

  ## Which words match the following:
    1. /t/
    2. /.n./
    3. /^t/
    4. /^...$/

## Solution
   1. grep t /basic/words.txt
   2. grep .n. /basic/words.txt
   3. grep ^t /basic/words.txt
   4. grep ^...$ /basic/words.txt

## Character Classes

In a Class
+ A character class matches one character, any character in the class.

/[abcde]/ # matches one character either a,b,c,d or e
/[a-e]/ # same- match one character a through e
/[a-z]/ # match one lower case alpha
/[0-9]/ # match one digit character

grep -P [a-z] /classes/text.txt
grep -P [a-z][0-9] /classes/text.txt
grep -P [a-z-][0-9] /classes/text.txt
grep -P [a-z\-][0-9] /classes/text.txt

Not In a Class
+ if the carat is the first character in a class, it means match a character not in the class

/[^abcde]/ # match one character, neither a,b,c,d or e
/[^a-e]/ # same - match one character, not a through e
/[^a-z]/ # match one non-lower case alpha
/[^0-9]/ # match one non digit character

grep -P [^a-z] /classes/text.txt
grep -P [^a-z][^0-9] /classes/text.txt
grep -P [^0-9][^a-z] /classes/text.txt

grep -P [0-9][0-9][0-9][0-9] /classes/phonenumbers.txt
grep -P '[0-9][0-9][0-9][ \-][0-9][0-9][0-9]' classes/phonenumbers.txt


# Posix Character Classes

/[[:lower:]]/  # same as /[a-z]/
/[[:alnum:]]/  # letters and digits [a-zA-Z0-9]
/[[:ascii:]]/  # ascii codes 0-127
/[[:blank:]]/  # space or tab [ \t]
/[[:cntrl:]]/  # control characters
/[[:digit:]]/  # digits [0-9]
/[[:graph:]]/  # printing characters, excluding space
/[[:print:]]/  # printing characters, excluding space
/[[:punct:]]/  # printing chars, excl letters, digits, space
/[[:space:]]/  # white space [ \t\n\f\r] and VT
/[[:upper:]]/  # upper case letters
/[[:word:]]/   # words characters [a-zA-Z0-9_]
/[[:xdigit:]]/ # hex digits

# Negate Posix Character Classes

/[[:^lower:]]/
/[[:^digit:]]/


/[12[:^digit:]]/ # match one char, either 1,2 or non-digit
/[abc[:^lower:]]/ # match one char, either a,b,c or non-lower

grep -P [[:lower:]] /classes/text.txt
grep -P [[:digit:]] /classes/text.txt
grep -P [[:^lower:]] /classes/text.txt

# Generic Character Classes

Some character classes are so common there is a shorthand version:

\d - digit [0-9]
\D - non-dgit [^0-9]
\w - word [a-zA-Z0-9]
\W - non-word [^a-zA-Z0-9_]
\s - space character [ \t\n\r\f]
\S - non-space [^  \t\n\r\f]
\h - horizontal white space
\H - non-horizontal white space
\v - vertical white space
\V - non-vertical white space

grep -P '\d\d\d\d' phonenumbers.txt
grep -P '\d\d\d-\d\d\d\d' phonenumbers.txt
grep -P '\d\d\d[ \-.]\d\d\d\d' phonenumbers.txt


#### Exercise 2
   In the quantifiers directory is a file words.txt
   
   Which words match the following:
   1. /[0-9]/
   2. /\w\s\d/
   3. /[[:upper:]]/
   4. /^[[:upper:]]/
   5. /[[:^alpha:]]$/

#### Solution

grep -P [0-9] words.txt
grep -P '\w\s\d' words.txt
grep -P [[:upper:]] words.txt
grep -P ^[[:upper]] words.txt
grep -P [[:^aplha:]]$ words.txt

# Quantifiers, Bounding and Alternation

## Quantifier Syntax
Think of quantifiers as "loops"

* - zero or more
+ - one or more
? - zero or one
{n} - n times
{n, } - n or more
{n,m} - n thorugh m

### Examples:
ab*c     -    "a", zero or more "b", "c"  {ac, abc, abbc, abbbc, ..}
ab+c     -    "a", one or more "b", "c"   {abc, abbc, abbbc, ..}
ab?c     -    "a", zero or one "b", "c"   {ac, abc}
ab{3}c   -    "a", 3"b", "c"              {abbbc}
ab{3, }c -    "a", three or more "b", "c" {abbbc, abbbbc, abbbbbc, ..}
ab{3,4}c -    "a", 3,4 or 5"b", "c"       {abbbc,abbbbc, abbbbbc}

### Commands
grep -P '\d{3}-\d{4}' phonenumbers.txt
grep -P '\d{3}[ \-.]\d{4}' phonenumbers.txt
grep -P '\d{3}[ \-.]?\d{4}' phonenumbers.txt
grep -P '\(?\d{3}[ \-.\)]*\d{3}[ \-.]?\d{4}' phonenumbers.txt

## Regex Rule #2
+ Quantifiers are greedy - they consume as much they changes

echo "abcabcbacabc" | grep -P ab.*c
echo "abcdefghijkl" | grep -P ab.*c  # a lot of extra work ie. backtracking

## Points
+ Quantifiers are by default greedy (aka maximal)
+ They match as much as they can 
+ When necessary, they backtrack 
+ Backtracking can be expensive 
+ There is a way to match the opposite: lazy (aka minimal)
+ There is a way to turn off backtracking

## Embedding Whitespace

Use: (?x)

/(?x) \(? \d{3} [ \-.\)]* \d{3} [ \-.]? \d{4}/

above regex can be written as (more readable):

/(?x) 
    \(?         # an optional open paren
    \d{3}       # area code
    [ \-.\)]*   # any number of separator chars
    \d{3}       # prefix
    [ \-.]?     # optional separator
    \d{4}       # line number
/

+ To include the space character use: \x20

/(?x) hello \x20 world /

## Inline Modifiers
+ PCRE
  (?x) - embed whitespace 
  (?i) - case insensitive match 
  (?s) - single line mode (. matches \n) 
  (?m) - multi-line mode (^ $ match begin/end of line)     
    \A - beginning of string     
    \Z - end of the string 

/(?xi) ^ [a-z]+ $ / # match a string of only alphas (lower or upper)
/(?x) ^ [[:alpha:]]+ $ / # same
/(?xs) ^ hello .* world $ / # match a string starting with "hello" and ending with "world",
                            # even if that string has \n characters (multiple lines as a single string)
/(?xm) ^ world / # match a string that has a line that begins with "world" (eg. "hello\nworld\n")


 ## Bounding 

• We have seen two bounding characters
^   - beginning of the string
$   - end of the string (or right before \n at the end) 

• Alternatives (useful when using (?m)):
\A   - beginning of string
\Z   - end of string (or right before \n at the end) 

• Word boundaries:
\b   - beginning or end of a word
\B   - not the beginning or end of a word 

grep -P '\bthe' text.txt
grep -P 'the\b' text.txt
grep -P '\bthe\b' text.txt
grep -P '\Bthe' text.txt
grep -P 'the\B' text.txt
grep -P '\Bthe\B' text.txt

## Alternation
+ Match either:
    /a|b/     # either "a" or "b"
    /one|two/ # either "one" or "two"

+ Use parens to apply precedence:
    /int|outside/  # either "in" or "outside"
    /(in|out)side/ # either "inside or outside"
    /today is (mon|tues)day/ # either "today is monday" or "today is tuesday"

+ Low precedence:
    /^first|second|third$/ # "first" at beginning of string, or "second" anywhere, or "third" at the end of the string
    /^(first|second|third)$/ # begin the string, followed by either "first" or "second" or "third", followed by the end of the string

# Matching Special Chars

+ Matching these special characters requires them to be escaped:
echo "***^HI$***" | grep -P '^\*\*\*\^HI\$\*\*\*$'

+ \Q thorugh \E turns off the special meaniing:

echo "***^HI$***" | grep -P '^\Q***^HI$***\E$'


### Exercise 3
    Create regexes to match:
    1. words that begin with 2 upper case letters
    2. words that end with either "u" or "z"
    3. words that begin and end with 2 vowels
    4. words that begin and end with more than one digit and that have non-digits in between
    5. sentences that have more than one occurrence of the word "the"