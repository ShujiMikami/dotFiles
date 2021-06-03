for /F %%i in ('type %TEMP%\nvimsocket') do set SERVERNAME=%%i
%HOME%\.pyenv\pyenv-win\versions\nvim-python3\Scripts\nvr --servername %SERVERNAME% --remote-send "%lG"
