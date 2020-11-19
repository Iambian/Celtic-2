Author Pseudoname..: Iambian Zenith
Location...........: Home
Version............: v1.2
Project Title......: List to String Converter
Program Package....: [LIST.8xp] [LIST.z80] [ReadME.txt]
Platform...........: TI-83 Plus Series / TI-84 Plus Series
_________
Warning:|
--------/
DO NOT VIEW THIS DOCUMENT
WITH WORD-WRAP ENABLED.
______________
Introduction:|
-------------/
A toolkit extension for Celtic that converts a list to a
string. Each list element must be a real integer.
_______________
Command input:|
--------------/
The inputs and outputs are as follows:

Str0  = Standard input string. Contains the list name used for input. It can
        be a system list or a user list (complete with the little "L" token)
Str9  = Standard output string. It contains the string that the list was 
        converted to.
_____________
Error Codes:|
------------/
You will probably get some errors when you try to use this program.
They will be outputted to Str9 in the event one such error did occur.
Here is a list of the errors that you will see, followed by the meaning
to each error code.

".1"  : Null String. The input string has nothing in it.
".2"  : String Not Found. The input string was not found.
".3"  : Entry too long. The line that you defined exceeds 5 letters.
".4"  : List Not Found. The list specified does not exist on the calc.
".5"  : Null list. The list defined has no elements to convert.
".6"  : A cryptic error code. The number you specified is less than 1.
".7"  : The list in question is archived. Please unarchive it.

Note that each error code was shortened to help save memory. Keep a
copy of all the error codes at all times if you plan to do any
serious debugging using this program. Or memorize the codes :)
______________
Known Issues:|
-------------/
 None known. All has been resolved. Except for the limitations imposed
 by the earlier text. Must be integers, and the list must be
 real, not complex. (otherwise, the complex part will be treated as
 another list element).
 Also, this program will not read an archived list, nor will it read an
 archived string. Why would you want to archive either of them, anyway?

____________
Disclaimer:|
-----------/
This program has been tested to function within operable limits. That means,
it should not crash if you make sure that the environment is perfect for
execution. I am not, however, responsible for any problems that my program
may cause, which includes but is not limited to erasure of imporant lines,
RAM clears, or possible Flash failures. Got a problem? It ain't none of mine.
Just don't use the program. Oh, and don't forget. You've been warned.
________________
Special Thanks:|
---------------/
( tifreak8x ) For getting me to develop this proggie to work alongside
              Celtic. Celtic is a real gem, and I'd do much to help it along.
( tr1p1ea )   For helping to debug the program.
_________________
Version History:|
----------------/
Private Releases:

.. you kidding? Development was a one-day thing!

Quasi-Public Releases:

v 1.0  -- Just for tifreak8x, this has the basic functionality. Beta tester.
V 1.1  -- Vastly accelerated routine by using a more direct access method. (linear)
           Also added another error code but the system itself will generate a
           memory error, which can become quite annoying if you wanted the error
           to come down gracefully.
v 1.2  -- A small edit to allow negative numbers to be accepted.

Copyright 2007 Rodger Weisman (Iambian Zenith)
You are free to distribute the binary, but this copyright must
exist with the distribution in some form. (I want credits :P )

.end