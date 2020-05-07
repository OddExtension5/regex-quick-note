# COMMANDS USED IN CLASS


+ find /location of file -exec grep -H regular {} \; 2>/dev/null
+ sed -i 's/zero/ZERO/' words.txt 
+ sed -i 's/ZERO/zero/' words.txt 
+ sed -i 's/[zZ]e[rR]o/ZERO/' words.txt 
+ grep Hello file.txt  # search Hello in file.txt 
+ grep Hello *  # search Hello in all files 
+ sed -i 's/hello/goodbye/g' msg.txt # replce text in a file
+ sed -i 's/hello/goodbye/g' ~/dir/*  # g means more than one hello is substiute in a line, otherwise only first hello is substitute



+ grep <- locate text (matches)
+ sed <- stream editing (replace)


+ **BRE - Base Regular Expressions (grep)**
+ **ERE - Extended Regular Expressions (egrep)**
+ **PCRE - Perl Compatible Regular Expressions (grep -P)**


##### g/re/p --> global/regex/print (grep)

+ grep 'hello' file location
+ grep 'hello|googbye' file-location ( | -> and )
+ grep 'hello\|goodbye' file-location ( \| -> or )
+ grep -E 'hello|goodbye' file-location ( grep -E -> egrep )

+ grep -P 'a..b' file-location


+ grep t words.txt
+ grep .n. words.txt
+ grep ^t words.txt
+ grep ^...$ words.txt

# Character Classes

+ /[abcde]/ --> match one character either a,b,c,d, or e 
+ /[a-e]/ --> same
+ /[a-z]/ --> match one lower case alpha
+ /[0-9]/
+ /[^abcde]/ -> character other than a,b,c,d,editing
+ /[^a-e]/
+ /[^a-z]/
+ /[^0-9]/

### POSIX Character Classes

+ alnum - letters and digits [a-zA-Z0-9]
+ alpha - letters [a-zA-Z]
+ ascii - ascii codes 0 - 127
+ blank - space or tab [ \t]
+ cntrl - control characters
+ digit - digits [0-9]
+ graph - printing characters, excluding space
+ lower - lower case letters
+ print - printing characters, including space
+ punct - printing chars, excl letters, digits, space
+ space - white space [ \t\n\f\r] and VT
+ upper - upper case letters
+ word - word characters [a-zA-Z0-9_]
+ xdigit - hex digits

+ /[[:lower:]]/  <- [a-z]
+ /[[:alnum:]]/
+ /[[:alpha:]]/
+ /[[:^lower:]]// ..> Non lower character
+ /[12[:^digit:]]/
+ /[abc[:^lower:]]/ --> match one char, either a,b,c or non-lower


### Generic Character Classes

> \d \D \w \W \s \S \h \H \v \V

**Some character classes are so common there is a shorthand version:**

+ \d - digit [0-9]
+ \D - non-digit [^0-9]
+ \w - word [a-zA-Z0-9_]
+ \W - non-word [^a-zA-Z0-9_]
+ \s - space character [ \t\n\r\f]
+ \S - non-space [^ \t\n\r\f]
+ \h - horizontal white space
+ \H - non-horizontal white space
+ \v - vertical white space
+ \V - non-vertical white space

+ grep -P '\d\d\d\d' phonenumbers.txt
+ grep -P '\d\d\d[ \-\.]\d\d\d\d' phonenumbers.txt

# Exercises

+ grep -P [0-9] words.txt
+ grep -P '\w\s\d' words.txt
+ grep -P [[:upper:]] words.txt
+ grep -P ^[[:upper:]] words.txt
+ grep -P [[:^alpha:]] words.txt


## Quantifiers, Bounding and Alteration

### Quantifiers (Loops)
  
  **Quantifiers are by default greedy (aka maximal)**

+ * --> zero or more
+ + --> one or more
+ ? --> zero or one
+ {n} --> n times
+ {n, } --> n or more
+ {n,m} --> n through m

+ ab*c --> "a", zero or more "b", "c" {ac, abc, abbc, abbbc , ...}
+ ab+c - "a" one ore more "b", "c"    {abc, abbc, abbbc ,..}
+ ab?c - "a", zero or one "b", "c"   {ac, abc}
+ ab{3}c - "a",3"b", "c" {abbc}
+ ab{3,}c - "a", three or more "b", "c" {abbbc, abbbbc, abbbbbc, abbbbbbc,..}
+ ab{3,5}c - "a",3,4 or 5 "b", "c" {abbbc, abbbbc, abbbbbc}


+ /ab.*c/   --> . goes to the end of the string


### Embedding Whitespace  (?x)

+ /(?(x) \(? \d{3}  [ \-\.]) 

## Bounding

+ ^, $, \A, \Z, \b, \B

## Alteration

+ /a|b/
+ /one|two/

#### Exercise 3

1. words that begin with 2 upper case letters

/^[A-Z]{2}/

2. words that end with wither "u" or "z"

/[uz]$/

3. words that begin and end with 2 vowels

/^[aeiou]{2}*[aeiou]{2}$/

4. words that begin and end with more than one digit and that have one-digits in between 

/(?x) ^ \d{2,} \D* \d{2,} $

5. sentences that have more tha one occurrences of the word "the"

/(?x) ( \bthe\b .* ){2}
