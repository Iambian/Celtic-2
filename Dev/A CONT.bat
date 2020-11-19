@echo off
copy /y CONTRAST.z80 ..\..\..\tasm\CONTRAST.z80
cd ..\..\..\tasm\
tasm -t80 -b -i CONTRAST.z80 CONTRAST.bin
devpac8x CONTRAST
move CONTRAST.8xp ..\_PROJECT\Celtic\Dev\8xp_bin\CONTRAST.8xp
del CONTRAST*
