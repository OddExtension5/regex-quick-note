# Problem

Create a regular expression to exactly match this gloriously contrived sentence:
The punctuation characters in the ASCII table are:

`` !"#$%&'()*+,-./:;<=>?@[\]^_`{|}~ ``


# Solution

**!"#\$%&'\(\)\*\+,-\./:;<=>\?@\[\\]\^_`\{\|}~**

**OR**

**\Q!"#$%&'()*+,-./:;<=>?@[\]^_`{|}~\E**


# Information

+ The 12 punctuation characters that make regular expressions work their magic are called **metacharacters**

+ If you want your regex to match them literally, you need to escape them by placing a blackslash in front of them.

     ``\$\(\)\*\+\.\?\[\\\^\{\| ``  ----->  ``$()*+.?[\^{|``

+ Left are ], - , }. The first two become metacharters only after an unescaped [, and the } only after an unescaped {. There's no need to ever escape.

+ 

+ Escaping an alphanumeric character either gives it a special meaning or throws a syntax error.

+ Perl, PCRE and Java support the regex **\Q** and **\E**. **\Q** suppresses the meaning of all metacharacters, including the backslash, until **\E**.

+ THe only benefit of **\Q...\E* is that it is easier to read them *\.\.\.\.**

+ By default, regular expressions are case sensitive. <regex> matches regex but not Regex, REGEX or ReGeX. To make <regex> match all of those, you need to turn on case insensitivity.

+ You can turn on case insensitivity by using mode modifier **(?i)**.
Example: (?i)regex



# Credit

+ [Regular Expression Cookbook](https://learning.oreilly.com/library/view/regular-expressions-cookbook/)