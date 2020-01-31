
# -*- coding: utf-8 -*-
#
# File openocd_runner.py
# Date: 2020-01-30
#

import os
import subprocess as sp
import time
import io
import sys
import threading
import queue

import pynvim

class Nvim_openocd_runner(object):
    def __init__(self, nvim, openocd_path):
        self._nvim = nvim
        self._openocd_path = openocd_path
        self._buf = None
        self._win = None
        self._openocdProc = None
        self._thread_openocdFlag = False

        
    def _createWindow(self):
        self._buf = self._nvim.request('nvim_create_buf', False, True)
        opts = {'relative': 'editor', 'width':80, 'height':10, 'col':81, 'row':(self._nvim.eval('&lines')-2), 'anchor': 'SW', 'style': 'minimal'}
        self._win = self._nvim.request('nvim_open_win', self._buf, 0, opts)

    def _destroyWindow(self):
        self._nvim.request('nvim_win_close', self._win, True)

    def _killopenocdProccess(self):
        self._openocdProc.kill()

    def _openocdMessageThread(self, scriptFiles):
        self._nvim.async_call(self._createWindow)

        executeStr = self._openocd_path

        for scriptFile in scriptFiles:
            executeStr = executeStr + r' -f ' + scriptFile

        self._openocdProc = sp.Popen(executeStr, stdout=sp.PIPE, stdin=sp.PIPE, stderr=sp.PIPE)

        self._thread_openocdFlag = True

        while self._thread_openocdFlag == True:
            messageLineStr = self._openocdProc.stderr.readline().decode().splitlines()
            self._nvim.async_call(self._writeToOpenocdWin, messageLineStr)
            time.sleep(0.5)

    def _writeToOpenocdWin(self, messageLineStr):
        self._nvim.request('nvim_buf_set_lines', self._buf, -1, -1, True, [str(messageLineStr[0])])
        lastline = self._nvim.request('nvim_buf_line_count', self._buf)
        self._nvim.request('nvim_win_set_cursor', self._win, (lastline, 1))

    def StartOpenocdDebugging(self, scriptFiles):
        thread_openocd = threading.Thread(target=self._openocdMessageThread, args=[scriptFiles])
        thread_openocd.start()
    
    def StopOpenocdDebugging(self):
        self._killopenocdProccess()
        self._thread_openocdFlag = False
        self._destroyWindow()





        

 

        
