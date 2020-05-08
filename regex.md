# Regular Expression Defined

A regular expression is a specific kind of text pattern that you can use with many modern applications and programming languages. You can use them to verify whether input fits into the text pattern, to find text that matches the pattern within a large body of text, to replace text matching the pattern with other text or rearranged bits of the matched text, to split a block of text into a list of subtexts, and to shoot yourself in the foot.

# HISTORY OF THE TERM 'REGULAR EXPRESSION'

The term regular expression comes from mathematics and computer science theory, where it reflects a trait of mathematical expressions called regularity. Such an expression can be implemented in software using a **deterministic finite automaton (DFA)**. 

A DFA is a finite state machine that doesn’t use **backtracking**.

The text patterns used by the earliest grep tools were regular expressions in the mathematical sense. Though the name has stuck, modern-day Perl-style regular expressions are not regular expressions at all in the mathematical sense. They’re implemented with a nondeterministic finite automaton (NFA).

# Regex Flavors

The most popular regex flavors in use today:

+ **Perl**
+ **PCRE** : It stands for ``"Perl-COmpatible Regular Expressions"`` C library developed by Philip Hazel.
You can download this open source at "http://www.pcre.org/."
+ **.NET**: The Microsoft .NET Framework provides a full-featured Perl-style regex flavour through the **System.Text.RegularExpressions** package.
+ **Java**: Java 4 is the first Java release to provide bult-in regular expression support through the **java.util.regex** package.
+ **JavaScript**: The regex flavor defined in version 3 of the ECMA-262 standard. This standard defines the ECMAScript programming language, which is better known through its JavaScript and JScript implementations in various web browsers.
+ **Python**: Python supports regular expressions through its **re** module.
+ **Ruby**: Ruby's regular expression support is part of the Ruby language itself, similar to Perl.