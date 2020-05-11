# Problem

Match a quoted character. 
+ Provide one solution that allows any single character, except a line break, between the quotes.

+ Provide another that truly allows any character, including line breaks.

# Solution

+ ANY CHARACTER EXCEPT LINE BREAKS

    ``'.'``

+ ANY CHARACTER INCLUDING LINE BREAKS

    ``'.'``

    **OR**

    ``'[\s\S]'``

    **OR**

    ``(?s)'.'``

    **OR**

    ``(?m)'.'``


# Information

+ Dot (``.``) meaning has always been to match any single character.

+ If you do want to allow your regular expression to span multiple lines, turn on the “dot matches line breaks” option.

+ If you cannot turn on "dot matches line breaks" mode outside the regular expressions, you can place a mode modifier at the start of the regular expression.

+ ``(?s)`` is the mode modifier for "dot matches line breaks". The s stands for "single line" mode.

+ Ruby uses ``(?m)`` to turn on "dot matches line breaks" mode.