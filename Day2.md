# Problem

Match a string of the following ASCII control characters: bell, escape, form feed, line feed, carriage return, horizontal tab, vertical tab.
These characters have the hexadecimal ASCII codes 07, 1B, oC, oA, oD, o9, oB


# Solution

**``\a\e\f\n\r\t\v``**

OR

**``\x07\x1B\f\n\r\t\v``**

OR

**``\a\e\f\n\r\t\x0B``*

OR

**``\cG\x1B\cL\cJ\cM\cI\cK``**

OR

**``\x07\x1B\x0C\x0A\x0D\x09\x0B``**



# Information

+ Seven of the most commonly used ASCII characters have dedicated escape sequences. These all consist of a backslash followed by a letter.

+ Nonprinting characters

| Representation   |  Meaning             | Hexadecimal Representation |
|------------------|----------------------|----------------------------|
|     <\a>         |  bell                |          oxo7              |
|     <\e>         |  escape              |          ox1B              |
|     <\f>         |  form feed           |          oxoC              |
|     <\n>         |  line feed (newline) |          oxoA              |
|     <\f>         |  carriage return     |          oxoD              |
|     <\t>         |  horizontal tab      |          oxo9              |
|     <\v>         |  vertical tab        |          oxoB              |

+ JavaScript does not support ‹\a› and ‹\e›.