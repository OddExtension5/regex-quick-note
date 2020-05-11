# Problem

Create one regular expression to match all common misspellings of calendar, so you can find this word in a document without having to trust the author’s spelling ability. Allow an a or e to be used in each of the vowel positions. 

Create another regular expression to match a single hexadecimal character.

Create a third regex to match a single character that is not a hexadecimal character


# Solution

+ **CALENDAR WITH MISSPELLINGS**

``c[ae]l[ae]nd[ae]r``

+ **HEXADECIMAL CHARACTER**

``[a-fA-F0-9]``

**OR**

``[a-fA-F\d]``

**OR**

``(?i)[A-F\d]``

+ **NONHEXADECIMAL CHARACTER**

``[^a-fA-F0-9]``

**OR**

``(?i)[^A-F\d]``


# Information

+ The notation using square brackets is called a **character class**

+ A character class mathes a single character out of a list of possible chracters.

+ Inside a character class, only four characters have a special function: \, ^, -, and ]

+ A caret (^) negates the character class if you place it immediately after the opening bracket. It makes the character class match any character that is not in the list.

+ A hyphen (-) creates a range when it is placed between two characters. The range includes the character before the hyphen, the character after the hyphen, and all characters that lie between them in numerical order.

+ **Note**: Reversed ranges, such as ‹[z-a]›, are not permitted.

+ Six regex tokens that consist of a backslash and a letter form shorthand character classes: ``‹\d›, ‹\D›, ‹\w›, ‹\W›, ‹\s› and ‹\S›``

+ Each lowercase shorthand character has an associated uppercase shorthand character with the opposite meaning.

+ Case Insensitivity: **(?i)**