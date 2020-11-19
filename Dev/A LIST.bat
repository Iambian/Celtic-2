@echo off
copy /y LIST.z80 ..\..\..\tasm\LIST.z80
cd ..\..\..\tasm\
tasm -t80 -b -i LIST.z80 LIST.bin
devpac8x LIST
move LIST.8xp ..\_PROJECT\Celtic\Dev\8xp_bin\LIST.8xp
del LIST*
