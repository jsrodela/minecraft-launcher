@echo off
set /P username=Enter username: 
echo Username set to %username%

IF exist python-3.10.11-embed-amd64 ( echo Python exists ) ELSE ( echo Downloading Python & curl https://www.python.org/ftp/python/3.10.11/python-3.10.11-embed-amd64.zip -o python-3.10.11-embed-amd64.zip && powershell -command "Expand-Archive -Path ./python-3.10.11-embed-amd64.zip -DestinationPath ./python-3.10.11-embed-amd64" )

set PATH=./python-3.10.11-embed-amd64;./python-3.10.11-embed-amd64/Scripts;
python -c "import os, sys; print(os.path.dirname(sys.executable))"

set pyc=./python-3.10.11-embed-amd64/python310._pth
echo python310.zip> %pyc% & echo .>> %pyc% & echo.>> %pyc% & echo #>> %pyc% & echo import site>> %pyc%

IF exist python-3.10.11-embed-amd64/Scripts/pip.exe ( echo pip exists ) ELSE ( echo Downloading pip & "C:\windows\system32\curl" https://bootstrap.pypa.io/get-pip.py -o get-pip.py && python get-pip.py && echo installed pip )
python -m pip --version

echo Launching Minecraft
pip install portablemc
portablemc search 1.20.1
portablemc --main-dir ./.minecraft --work-dir ./.minecraft start --username %username% --server mcserver.rodela.tk --server-port 25565 1.20.1
pause

@REM https://github.com/mindstorm38/portablemc
