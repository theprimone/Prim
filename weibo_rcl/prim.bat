@echo off
set "root_path=c:\prim\"
set "firefoxconf=%root_path%firefoxconf.selenium"
echo Ŀ���ļ��� %firefoxconf%
if exist %firefoxconf% (echo %firefoxconf%�Ѵ���
) else (
md %firefoxconf%
echo �½�%firefoxconf%
)
set "pwd=%~dp0"
::echo pwd is
::echo %pwd%
::echo path is
::echo %path%
set "selenium=%pwd%firefoxconf.selenium"
echo Դ�ļ��� %selenium%
Xcopy "%selenium%" "%firefoxconf%" /s /e /d /y
echo ��ӻ�������������ϵͳ��������

if not exist sys_path_bak.txt (call sys_path_bak.bat)

set /p path_=<sys_path_bak.txt
echo ��������sys_path_bak: %path_%

::set "new_path=%path_%;%pwd%"
echo �޸ĺ��path: %new_path%
rem �ϲ��û�path��ϵͳpath
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Environment" /v path /d "%path_%
::reg add "HKCU\Environment" /v path /d "%new_path%
setx "Path" "%pwd%
echo �޸ĺ�Ļ�������:
reg query "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Environment" /v path
reg query "HKCU\Environment" /v path
pause