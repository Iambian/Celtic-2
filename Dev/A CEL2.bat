@echo off
copy /y CELTIC2.z80 ..\..\..\tasm\CELTIC2.z80
copy /y R\ ..\..\..\tasm\R\
cd ..\..\..\tasm\
tasm -t80 -b -i CELTIC2.z80 CELTIC2.bin
devpac8x CELTIC2
move CELTIC2.8xp ..\_PROJECT\Celtic\Dev\8xp_bin\CELTIC2.8xp
del CELTIC2*
del /q R\*
