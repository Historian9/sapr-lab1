@echo off
rem Lab 1, variant 3: full compilation from the command line (Quartus II 13.0 SP1)
rem Run from the "altera" folder:  build.bat
quartus_sh --flow compile lab1_v3
if errorlevel 1 (echo COMPILATION FAILED & pause & exit /b 1)
if not exist reports mkdir reports
copy /Y output_files\lab1_v3.flow.rpt    reports\
copy /Y output_files\lab1_v3.fit.summary reports\
copy /Y output_files\lab1_v3.fit.rpt     reports\
copy /Y output_files\lab1_v3.sta.summary reports\
copy /Y output_files\lab1_v3.sta.rpt     reports\
copy /Y output_files\lab1_v3.pin         reports\
if not exist firmware mkdir firmware
copy /Y output_files\lab1_v3.sof         firmware\
echo Done: reports\ (area, timing), firmware\lab1_v3.sof
pause
