
# -*- coding: utf-8 -*-
#
# File gdb_runner.py
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

class Nvim_gdb_runner(object):
    def __init__(self, nvim, gdb_path):
        self._nvim = nvim
        self._gdb_path = gdb_path
        self._buf = None
        self._win = None
        self._gdbProc = None
        self._thread_gdbFlag = False

        
    def _createWindow(self):
        self._buf = self._nvim.request('nvim_create_buf', False, True)
        opts = {'relative': 'editor', 'width':80, 'height':10, 'col':0, 'row':(self._nvim.eval('&lines')-2), 'anchor': 'SW', 'style': 'minimal'}
        self._win = self._nvim.request('nvim_open_win', self._buf, 0, opts)

    def _destroyWindow(self):
        self._nvim.request('nvim_win_close', self._win, True)

    def _killGdbProccess(self):
        self._gdbProc.kill()

    def _getCurrentBufLine(self):
        return self._nvim.request('nvim_buf_get_lines', self._buf, -2, -1, True)[0] 

    def _gdbMessageThread(self, elfFile):
        executeStr = self._gdb_path + r' ' + elfFile

        self._gdbProc = sp.Popen(executeStr, stdout=sp.PIPE, stdin=sp.PIPE, stderr=sp.PIPE)

        self._thread_gdbFlag = True

        newLineFlag = False
        strLine = ""
        while self._thread_gdbFlag == True:
            out = self._gdbProc.stdout.read(1)
            self._gdbProc.stdout.flush()
 
            if out == '' and self._gdbProc.poll() != None:
                break
            if out != '':
                if out.decode() != '\r' and out.decode() != '\n' and out.decode() != '^M':
                    strLine = strLine + out.decode()
                    self._nvim.async_call(self._writeToGdbWin, strLine, newLineFlag)

                    if newLineFlag == True:
                        newLineFlag = False
                else :
                    newLineFlag = True
                    strLine = ""


    def _writeToGdbWin(self, messageLineStr, newLine):
        if newLine == False:
            currentLine = messageLineStr
            self._nvim.request('nvim_buf_set_lines', self._buf, -2, -1, True, [currentLine])
        else:
            self._nvim.request('nvim_buf_set_lines', self._buf, -1, -1, True, [messageLineStr])
            lastline = self._nvim.request('nvim_buf_line_count', self._buf)
            self._nvim.request('nvim_win_set_cursor', self._win, (lastline, 1))

    def _addToCurrentLineGdbWin(self, messageLineStr, nextLine=True):
        lineToWrite = self._nvim.request('nvim_buf_get_lines', self._buf, -2, -1, True)[0] + messageLineStr

        self._writeToGdbWin(lineToWrite, False)

        if nextLine == True:
            self._writeToGdbWin("", True)

    def SendGdbCommand(self, commandMessage):
        self._addToCurrentLineGdbWin(commandMessage)
        self._gdbProc.stdin.write(commandMessage.encode("utf8") + b"\n")
        self._gdbProc.stdin.flush()

    def StartGdbDebugging(self, elfFile):
        self._createWindow()
        thread_gdb = threading.Thread(target=self._gdbMessageThread, args=[elfFile])
        thread_gdb.start()
    
    def StopGdbDebugging(self):
        self._killGdbProccess()
        self._thread_gdbFlag = False
        self._destroyWindow()

