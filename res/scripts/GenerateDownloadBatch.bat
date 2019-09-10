@rem - Encoding:utf-8; Mode:Batch; Language:en; LineEndings:CRLF -
:: Used for "Deploy.bat" in :Create_Download-bat
:: Please make sure that: only call this batch when %cd% is %root%; call "res\scripts\lang_*.bat" before calling this batch.
:: e.g. 
:: call res\scripts\GenerateDownloadBatch.bat portable

@echo off
set "dl-bat-filename=%str_dl-bat%.bat"
REM if "%DeployMode%"=="unknown" exit
call :GenerateDownloadBatch_Common
call :GenerateDownloadBatch-%~1
call :GenerateDownloadBatch_Common2
goto :eof


rem ================= FUNCTIONS =================


:GenerateDownloadBatch_Common
echo :: ^>^>^> EDIT AT YOUR OWN RISK. ^<^<^<>%dl-bat-filename%
echo @echo off>>%dl-bat-filename%
echo.>>%dl-bat-filename%
echo if NOT exist usr\ (>>%dl-bat-filename%
echo     echo. ^& echo %str_dl-bat-moved%>>%dl-bat-filename%
echo     pause^>NUL ^& exit>>%dl-bat-filename%
echo )>>%dl-bat-filename%
echo color F0>>%dl-bat-filename%
echo.>>%dl-bat-filename%
echo set "root=%%cd%%">>%dl-bat-filename%
echo set "pyBin=%%root%%\usr\python-embed">>%dl-bat-filename%
echo set "ygBin=%%root%%\usr\you-get">>%dl-bat-filename%
echo set "ydBin=%%root%%\usr\youtube-dl">>%dl-bat-filename%
echo set "anBin=%%root%%\usr">>%dl-bat-filename%
echo set "ffBin=%%root%%\usr\ffmpeg\bin">>%dl-bat-filename%
echo set "PATH=%%root%%\res\command;%%pyBin%%;%%pyBin%%\Scripts;%%anBin%%;%%ffBin%%;%%PATH%%">>%dl-bat-filename%
echo if NOT exist res\command md res\command>>%dl-bat-filename%
echo del /Q res\command\*.cmd ^>NUL 2^>NUL>>%dl-bat-filename%
echo.>>%dl-bat-filename%
goto :eof


:GenerateDownloadBatch_Common2
echo.>>%dl-bat-filename%
echo if NOT exist Download md Download>>%dl-bat-filename%
echo cd Download>>%dl-bat-filename%
echo.>>%dl-bat-filename%
echo title %str_dl-bat%>>%dl-bat-filename%
echo echo %str_dl-guide1%>>%dl-bat-filename%
echo echo %str_dl-guide2%>>%dl-bat-filename%
echo echo.>>%dl-bat-filename%
echo echo %str_dl-guide3%>>%dl-bat-filename%
echo echo you-get https://v.youku.com/v_show/id_aBCdefGh.html>>%dl-bat-filename%
echo echo youtube-dl https://www.youtube.com/watch?v=aBCdefGh>>%dl-bat-filename%
echo echo annie https://www.bilibili.com/video/av12345678>>%dl-bat-filename%
echo echo.>>%dl-bat-filename%
echo echo %str_dl-guide4%>>%dl-bat-filename%
echo echo.>>%dl-bat-filename%
echo echo.>>%dl-bat-filename%
echo echo %str_dl-guide5%>>%dl-bat-filename%
echo echo you-get:    https://github.com/soimort/you-get/wiki/%str_dl-guide_wiki%>>%dl-bat-filename%
echo echo youtube-dl: https://github.com/ytdl-org/youtube-dl/blob/master/README.md>>%dl-bat-filename%
echo echo annie:      https://github.com/iawia002/annie/blob/master/README.md>>%dl-bat-filename%
echo echo.>>%dl-bat-filename%
echo echo.>>%dl-bat-filename%
::PROMPT [$D $T$h$h$h$h$h$h]$_$P$_$G$G$G
echo PROMPT $P$_$G$G$G>>%dl-bat-filename%
echo cmd /Q /K>>%dl-bat-filename%
goto :eof


:GenerateDownloadBatch-portable
echo echo @"%%pyBin%%\python.exe" "%%ygBin%%\you-get" %%%%*^> res\command\you-get.cmd>>%dl-bat-filename%
:: echo @python ..\usr\you-get\you-get %%*> res\command\you-get.cmd
echo echo @"%%pyBin%%\python.exe" "%%ydBin%%\youtube-dl" %%%%*^> res\command\youtube-dl.cmd>>%dl-bat-filename%
goto :eof


:GenerateDownloadBatch-withpip
echo echo @"%%pyBin%%\python.exe" "%%pyBin%%\Scripts\pip3.exe" %%%%*^> res\command\pip3.cmd>>%dl-bat-filename%
echo echo @"%%pyBin%%\python.exe" "%%pyBin%%\Scripts\pip.exe" %%%%*^> res\command\pip.cmd>>%dl-bat-filename%
echo echo @"%%pyBin%%\python.exe" "%%pyBin%%\Scripts\wheel.exe" %%%%*^> res\command\wheel.cmd>>%dl-bat-filename%
echo echo @"%%pyBin%%\python.exe" "%%pyBin%%\Scripts\easy_install.exe" %%%%*^> res\command\easy_install.cmd>>%dl-bat-filename%
echo echo @"%%pyBin%%\python.exe" "%%pyBin%%\Scripts\you-get.exe" %%%%*^> res\command\you-get.cmd>>%dl-bat-filename%
echo echo @"%%pyBin%%\python.exe" "%%pyBin%%\Scripts\youtube-dl.exe" %%%%*^> res\command\youtube-dl.cmd>>%dl-bat-filename%
goto :eof


:GenerateDownloadBatch-quickstart
echo echo @"%%pyBin%%\python.exe" "%%ygBin%%\you-get" %%%%*^> res\command\you-get.cmd>>%dl-bat-filename%
goto :eof


rem ================= End of File =================