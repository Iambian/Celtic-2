Author Pseudoname..: Iambian Zenith
Date...............: O RLY?
Version............: v2.4
Project Title......: Celtic
Program Package....: (README) (BINARY) (SOURCE)
Platform...........: TI-83 Plus Series / TI-84 Plus Series
_________
Warning:|
--------/
DO NOT VIEW THIS DOCUMENT
WITH WORD-WRAP ENABLED.
______________
Introduction:|
-------------/
EDIT 2020: THIS PROJECT EXISTS ON GITHUB ONLY FOR ARCHIVAL PURPOSES.

This is a toolkit for BASIC programs designed to edit or pull together
other BASIC programs into a custom-made file that is ready for
execution. It features the ability to read lines from either RAM or
Flash (archive), the ability to insert, delete, or overwrite lines in
a specified program, to create a specified program and to find out how
many lines there are in a BASIC program, and to output special
characters into a string that is not normally storable into a string
via any other method (doublequote and sto).
_____________
Definitions:|
------------/
The inputs and outputs are as follows:

Theta = Command input, containing the function number for the command.
Ans   = Answer variable. Usually defines the line number to search for.
Str0  = Standard input string. Depends on function, but is generally
        the name of the program to read from.
Str9  = Standard output string. It contains the output for a function.
        This string is also used for input if a line is being written.

Make sure the program you're reading from is either a BASIC program or
a carefully crafted data file that is meant to be read in this fashion.
_______
NOTE!:|
------/
If you input a program's name, you can prefix it with the token
"rowSwap(", which is found in the Matrix menu, you ask the program to
look up the name as an AppVar instead of as a program. Example:

"ABBA"->Str0            //refers to a program
"rowSwap(ABBA"->Str0    //refers to an appvar.

Important to remember:
(1) You DO NOT CLOSE the parentheses.
(2) The "rowSwap(" goes inside the quotes so that it's read as part
    of the string. The technical reason why I do this is because the
    byte referring to "rowSwap(" is $15, which corresponds to the
    AppVar variable type.

Also, you may use lowercase for AppVars, but you will screw up your
program names (you cannot reference them in your program) if you try
to do that with a program var. Always use uppercase letters w/o spaces
for names unless you are, say, accessing another appvar
(i.e. "MirageOS") or you are sure you're not going to try to create
another program, or that there's no conflict with names.

"rowSwap(MirageOS"->Str0   //referring to AppVar "MirageOS". Heh.

_______________
Command input:|
--------------/
All commands are sent through variable Theta (the character next to
the "Z" key on the calculator). All commands are numeric, and the
following list shows what numbers tell the program to do what.

---------------------------------------------------------------------------------
Theta = 0 : Read a line from a program

 Inputs: Str0 = Name of program to read from
         Ans  = Line number to read from (first line is "1")
 Output: Str9 = Contents of line read. Error "..NULLINE" if the line is empty.
                May also contain other error codes if conditions are wrong.

 Others: If Ans = 0, then Theta will be overwritten with the number of lines
         in the program being read. Useful for editors, curiousities, and verification.

---------------------------------------------------------------------------------
Theta = 1 : Replace (overwrite) a line in a program
 Inputs: Str0 = Name of program to read from
         Ans  = Line number to write to (first line is "1")
         Str9 = Material to replace line in Ans with

 Output: Str9 = If it's intact, no error occurred. Else, check for error codes.

---------------------------------------------------------------------------------
Theta = 2 : Insert a line in a program

 Inputs: Str0 = Name of program to read from
         Ans  = Line number to write to (first line is "1")
         Str9 = Material to insert into a program. The line
                that was occupied is shifted down one line and
                this string is inserted into the resulting spot

 Output: Str9 = If it's intact, no error occurred. Else, check for error codes.

---------------------------------------------------------------------------------
Theta = 3 : Output "special" string containing STO and doublequote chars

 Inputs: None

 Outputs: Str9 = Sto and doublequote characters, in that order. Use substrings
                 to extract them. If using the standard version of Celtic, the
                 string will be 9 characters long, the other 7 being junk. This
                 should not affect the integrity of string just as long as you
                 extract only the first two characters.

---------------------------------------------------------------------------------
Theta = 4 : Create a program variable given a name
 Inputs: Str0 = Program name to create

 Outputs: Str9 = Intact if nothing went wrong. Otherwise, an error code results.
          If successful, you will be able to read the first line of the newly
          created program as a null line.
          Str0 = Intact with program's name to be created.

---------------------------------------------------------------------------------
Theta = 5 : Archive/unarchive a program variable given a name

 Inputs: Str0 = Program name to archive/unarchive

 Outputs: The resulting program is shifted between mediums.

---------------------------------------------------------------------------------
Theta = 6 : Delete a program variable given a name

 Inputs: Str0 = Program name to delete

 Outputs: The resulting program is deleted.

---------------------------------------------------------------------------------
Theta = 7 : Delete a line from a program

 Inputs: Str0 = Name of program to delete from
         Ans  = Line number to delete from (first line is "1")
 Output: Str9 = Contains error codes if conditions are wrong.

 Others: If Ans = 0, then Theta will be overwritten with the number of
         lines in the program being read.

---------------------------------------------------------------------------------
Theta = 8 : Output status string

 Inputs: Str0 = Name of program to check
 Output: Str9 = Contains 9 byte output codes.
         1st character: "A"=Archived  "R"=RAM "     "E"=ExRAM
         2nd character: "V"=Visible   "H"=Hidden
         3rd character: "L"=Locked    "W"=Writable  "O"=AppVar
         4th character: --RESERVED-- (filled with space char)

         Five character string afterward is the size of data portion of variable

---------------------------------------------------------------------------------

__________
Examples:|
---------/
Perhaps you wanted to write your own BASIC program from within a BASIC
program. We can create a new program called "HELLO" and have it be the
ever-famous "Hello World" program.
(the starting colons on each line are implied)
(let "T" represent variable theta, and "->" represent the STO symbol)

"HELLO"->Str0                         //Store program name in Str0 for input
4->T                                  //Command 4: Create new program
Asm(prgmCELTIC2)                      //Execute util.
3->T                                  //Command 3: Create special char string
Asm(prgmCELTIC2)                      //Execute util.
sub(Str9,2,1)->Str1                   //Extract doublequote char and put it in Str1
"Disp"+Str1+"HELLO WORLD"+Str1->Str9  //String concentration. "Disp" is BASIC token, not text
1->T                                  //Command 1: Overwrite line
1                                     //Storing 1 to Ans var. Write to line one
Asm(prgmCELTIC2)                      //Execute util.
prgmHELLO                             //Run the newly created program.
                                      //Creating a "HELLO WORLD" program should've been simpler :P

You know. I'm still working on this. More examples later, but at least
the example here shows what the program is capable of. Use it to read
from other programs (not shown in example) and then output to a new
program. Or you could save high score information in games, or string
data for large RPGs.

Of course, none of these examples shows the use of error codes; it
assumes that conditions are perfect when the program runs, but in your
case, it might not be. For example. prgmHELLO in the first example
could've already existed and that possibility could've been tested by
checking error codes before trying to write them.
_____________
Error Codes:|
------------/
You will probably get some errors when you try to use this program.
They will be outputted to Str9 in the event one such error did occur.
Here is a list of the errors that you will see and meanings to them:

"..P:IS:FN" : Program Is Found. User tried to create an existing program
"..NUMSTNG" : Status message. Shows that the # of lines is in Theta.
"..NULLSTR" : Null String. User passed an empty string to Celtic
"..L:NT:FN" : Line Not Found. Line number defined in Theta isn't there.
"..S:NT:FN" : String Not Found. Str9/Str0 is not defined or is archived.
"..E:2:LNG" : Entry too long. Not enough memory to store read string.
"..S:2:LNG" : String Too Long. Str0 exceeds max filename length
"..NULLVAR" : Null variable. A string or a variable has not been set.
"..P:NT:FN" : Program Not Found. Name of program in Str0 is undefined.
"..PGM:ARC" : Program Archived. User tried to edit an archived file.
"..T:NT:FN" : Theta Not Found. Theta is not defined or is archived.
"..NULLINE" : Null Line. User attempted to read an empty line.

____________
Disclaimer:|
-----------/
----------------------------------------------------------------------
Although this program has been tested to ensure that it doesn't
crash outright, there is no guarantee that this program will not
perform an undesired action that may result in loss of data, loss of
profits, loss of time, or just a general loss of anything. I do not
take responsibility for any problems that this program may cause, and
all responsibility is thusly transferred to the user.
In essence, if you have a problem, I am not obligated to take
responsibility in any way, shape, or form. Got a problem? Don't
use the program.
_________________
Version History:|
----------------/
Afterthoughts are not nice. I don't really
have a version history.

1.0 -- simple line count and reading
1.4 -- slimmed code down

2.0 -- rewrote entire program, added line add and delete function
2.1 -- rewrote code to allow transparent flash-based operations
2.2 -- added in create/delete/(un)archive program with appvar support
2.3 -- re-implemented untested delete line function
2.4 -- Added program status output. See appropriate section. Cmd 8

________________
Special Thanks:|
---------------/
(telroth / Darth Android) - For asking me to develop a program like this.
( tifreak8x )             - Thanks for being one of my first users
UTI Forum users           - Thanks for supporting my project 100%
DragonFire IRC users      - Thanks for beta testing more unstable versions

Did I forget your name? I don't actually check email, so just find me in the
DragonFire chatrooms. irc://www.unitedti.org/UnitedTI
Now that I remember, I *know* I forgot someone, especially that guy who
asked me about making the program do things like change lines around.

Copyright © 2007 Rodger Weisman (Iambian Zenith)