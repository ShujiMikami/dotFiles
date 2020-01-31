# -*- coding: utf-8 -*-
#
# File __init__
# Date: 2020-01-10
#

import os
import subprocess as sp
import time
import io
import sys
import threading
import queue
from .sub_modules import settings_reader
from .sub_modules import openocd_runner
from .sub_modules import gdb_runner

import pynvim


@pynvim.plugin
class Nvim_arm_openocd_gdb_debug(object):
    def __init__(self, nvim):
        self.nvim = nvim
        self._openocdRunFlag = False
        self._openocdProc = None 
        self._gdbRunFlag = False
        self._gdbProc = None


    def _openocdThread(self, openocdPath, scriptFiles, openocdWindow):
        executeStr = openocdPath

        for scriptFile in scriptFiles:
            executeStr = executeStr + r' -f ' + scriptFile
        self._openocdProc = sp.Popen(executeStr, stdout=sp.PIPE, stdin=sp.PIPE, stderr=sp.PIPE)

        while self._openocdRunFlag == True:
           openocdWindow.buffer.append(self._openocdProc.stderr.readline().decode().splitlines())

    def _startOpenocdSession(self, openocdPath, scriptFiles, openocdWindow):
        self._openocdRunFlag = True
        self.nvim.async_call(self._openocdThread, openocdPath, scriptFiles, openocdWindow)

    def _killOpenocdSession(self):
        self._openocdRunFlag = False
        self._openocdProc.kill()
        
    def _gdbThread(self, gdbPath, targetProgramPath, gdbWindow):
        executeStr = gdbPath + ' ' + targetProgramPath
        self._gdbProc = sp.Popen(executeStr, stdout=sp.PIPE, stdin=sp.PIPE, stderr=sp.PIPE)

        while self._gdbRunFlag == True:
            out = self._gdbProc.stdout.read(1)
            if out == '' and self._gdbProc.poll() != None:
                break
            if out != '':
                gdbWindow.buffer.append(out.decode().splitlines())

    def _startGdbSession(self, gdbPath, targetProgramPath, gdbWindow):
        self._gdbRunFlag = True
        self.nvim.async_call(self._gdbThread, gdbPath, targetProgramPath, gdbWindow)

    def _killGdbSession(self):
        self._gdbRunFlag = False
        self._gdbProc.kill()

    gdbProc = None
    openocdProc = None

    currwin = None
    openocdwin = None
    gdbwin = None

    @pynvim.function('TestFunction2')
    def testfunction2(self, args):
        self.addToGdbWin_wo_newline('target remote localhost:3333')
        self.gdbwin.buffer.append("")
        self.strLine = ""
        self.gdbProc.stdin.write('target remote localhost:3333'.encode("utf8") + b"\n")
        self.gdbProc.stdin.flush()

    @pynvim.function('TestFunction3')
    def testfunction3(self, args):
        self.addToGdbWin_wo_newline('interrupt')
        self.gdbwin.buffer.append("")
        self.strLine = ""
        self.gdbProc.stdin.write('interrupt'.encode("utf8") + b"\n")
        self.gdbProc.stdin.flush()

    @pynvim.function('TestFunction4')
    def testfunction4(self, args):
        self.addToGdbWin_wo_newline('monitor reset halt')
        self.gdbwin.buffer.append("")
        self.strLine = ""
        self.gdbProc.stdin.write('montor reset halt'.encode("utf8") + b"\n")
        self.gdbProc.stdin.flush()

    @pynvim.function('TestFunction5')
    def testfunction5(self, args):
        self.addToGdbWin_wo_newline('load')
        self.gdbwin.buffer.append("")
        self.strLine = ""
        self.gdbProc.stdin.write('load'.encode("utf8") + b"\n")
        self.gdbProc.stdin.flush()

    @pynvim.function('TestFunction6')
    def testfunction6(self, args):
        self.addToGdbWin_wo_newline('tb main')
        self.gdbwin.buffer.append("")
        self.strLine = ""
        self.gdbProc.stdin.write('tb main'.encode("utf8") + b"\n")
        self.gdbProc.stdin.flush()

    @pynvim.function('TestFunction7')
    def testfunction7(self, args):
        self.addToGdbWin_wo_newline('continue')
        self.gdbwin.buffer.append("")
        self.strLine = ""
        self.gdbProc.stdin.write('continue'.encode("utf8") + b"\n")
        self.gdbProc.stdin.flush()

    @pynvim.function('TestFunction8')
    def testfunction8(self, args):
        currentDir = self.nvim.command_output('pwd')
        settings = settings_reader.SettingReader(currentDir)
        self.nvim.command('echo ' + '\'' + settings.effectiveItem + '\'')
 
    @pynvim.function('TestFunction9')
    def testfunction9(self, args):
        currentDir = self.nvim.command_output('pwd')
        settings = settings_reader.SettingReader(currentDir)
        self.nvim.command('echo ' + '\'' + settings.effectiveItem + '\'')
 
    @pynvim.function('TestFunction10')
    def testfunction10(self, args):
        buf = self.nvim.request('nvim_create_buf', False, True)
        self.nvim.request('nvim_buf_set_lines', buf, 0, -1, True, ["test", "text"])
        opts = {'relative': 'editor', 'width':10, 'height':3, 'col':10, 'row':self.nvim.eval('&lines'), 'anchor': 'SW', 'style': 'minimal'}
        win = self.nvim.request('nvim_open_win', buf, 0, opts)
        time.sleep(1)
        self.nvim.request('nvim_buf_set_lines', buf, -1, -1, True, ["add"])
        time.sleep(1)
        self.nvim.request('nvim_buf_set_lines', buf, -1, -1, True, ["add"])
        time.sleep(1)
        self.nvim.request('nvim_buf_set_lines', buf, -1, -1, True, ["add"])
        time.sleep(1)
        self.nvim.request('nvim_buf_set_lines', buf, -1, -1, True, ["add"])
        time.sleep(1)
        self.nvim.request('nvim_buf_set_lines', buf, -1, -1, True, ["add"])
        time.sleep(1)
        self.nvim.request('nvim_buf_set_lines', buf, -2, -1, True, ["replace"])
        time.sleep(1)
        lastline = self.nvim.request('nvim_buf_line_count', buf)
        self.nvim.request('nvim_win_set_cursor', win, (lastline, 1))
        time.sleep(1)
        self.nvim.request('nvim_win_close', win, True)

    gdbrunnner = None

    @pynvim.function('TestFunction11')
    def testfunction11(self, args):
        FW_WORKSPACE_ROOT = r'C:\Users\mm07860\workspace\gohei_system4\FW'
        os.chdir(FW_WORKSPACE_ROOT)
 
        openocdrunner = openocd_runner.Nvim_openocd_runner(self.nvim, os.environ['ECLIPSE_OPENOCD_BIN_DIR'] + r'\openocd')
        openocdrunner.StartOpenocdDebugging(['.\stlink.cfg', '.\stm32f4x.cfg'])

        self.gdbrunner = gdb_runner.Nvim_gdb_runner(self.nvim, os.environ['ARM_NONE_EABI_TOOLS_DIR'] + r'\arm-none-eabi-gdb')
        self.gdbrunner.StartGdbDebugging(r'.\build\gohei_system4_FW.elf')

    @pynvim.function('TestFunction12')
    def testfunction12(self, args):
        self.gdbrunner.SendGdbCommand('target remote localhost:3333')

    @pynvim.function('TestFunction')
    def testfunction(self, args):
        self.currwin = self.nvim.current.window

        self.nvim.command("split openocdmessage")
        self.openocdwin = self.nvim.current.window

        self.nvim.command("vsplit gdbmessage")
        self.gdbwin = self.nvim.current.window

        self.nvim.current.window = self.currwin

        OPENOCD_EXECUTABLE = os.environ['ECLIPSE_OPENOCD_BIN_DIR'] + r'\openocd'
         
        FW_WORKSPACE_ROOT = r'C:\Users\mm07860\workspace\gohei_system4\FW'
        os.chdir(FW_WORKSPACE_ROOT)
        
        self.openocdProc = sp.Popen(OPENOCD_EXECUTABLE + r' -f .\stlink.cfg -f .\stm32f4x.cfg', stdout=sp.PIPE, stdin=sp.PIPE, stderr=sp.PIPE)

        GDB_EXECUTABLE = os.environ['ARM_NONE_EABI_TOOLS_DIR'] + r'\arm-none-eabi-gdb'


        self.gdbProc = sp.Popen(GDB_EXECUTABLE + r' .\build\gohei_system4_FW.elf', stdout=sp.PIPE, stdin=sp.PIPE, stderr=sp.PIPE)
        
        thread_openocd = threading.Thread(target = self.openocdThread)
        thread_gdb = threading.Thread(target = self.gdbThread)


        thread_openocd.start()
        thread_gdb.start()

    openocdRunFlag = True
    def openocdThread(self):
        while self.openocdRunFlag == True:
            messageLineStr = self.openocdProc.stderr.readline().decode().splitlines()
            self.nvim.async_call(self.writeToOpenocdWin, messageLineStr)

    def writeToOpenocdWin(self, message, index=-1):
        self.openocdwin.buffer.append(message, index)

    def addToGdbWin_wo_newline(self, message):
        existingStr = str(self.gdbwin.buffer.request('nvim_buf_get_lines', -2, -1, True)[0])

        strToReWrite = existingStr + str(message)

        self.gdbwin.buffer.request('nvim_buf_set_lines', -2, -1, True, [strToReWrite]) 
    def writeToGdbWin(self, message, index):
        if index != 0:
            self.gdbwin.buffer.request('nvim_buf_set_lines', index - 1, index, True, [message]) 
        else:
            self.gdbwin.buffer.append("")

    gdbRunFlag = True
    strLine = ""
    def gdbThread(self):
        strLinePos = -1
        while self.gdbRunFlag == True:
            out = self.gdbProc.stdout.read(1)
            self.gdbProc.stdout.flush()
            if out == '' and self.gdbProc.poll() != None:
                break
            if out != '':
                if out.decode() != '\r' and out.decode() != '\n' and out.decode() != '^M':
                    self.strLine = self.strLine + out.decode()
                    self.nvim.async_call(self.writeToGdbWin, self.strLine, strLinePos)
                    strLinePos = -1
                else :
                    self.strLine = ""
                    strLinePos = 0

    def messageWriteWin(self):
        self.openocdwin.buffer.append('openocd dayo')
        self.gdbwin.buffer.append('gdb dayo')
        while True:
            if not self.openocdMessageLineQueue.empty():
                self.openocdwin.buffer.append(self.openocdMessageLineQueue.get())

            if not self.gdbMessageLineQueue.empty():
                self.gdbwin.buffer.append(self.gdbMessageLineQueue.get())

    @pynvim.command('TestCommand', nargs='*', range='')
    def testcommand(self, args, range):
        self.nvim.current.line = ('Command with args: {}, range: {}'.format(args, range))

