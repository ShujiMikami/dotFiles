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
#        self.writeToGdbWin('target remote localhost:3333', -1)
        self.addToGdbWin_wo_newline('target remote localhost:3333')
        self.gdbwin.buffer.append("")
        self.gdbProc.stdin.write('target remote localhost:3333'.encode("utf8") + b"\n")
        self.gdbProc.stdin.flush()
#        self.openocdwin.buffer.append('added')
#        self.nvim.command('echo 2')

    @pynvim.function('TestFunction3')
    def testfunction3(self, args):
        self.gdbProc.stdin.write('interrupt'.encode("utf8") + b"\n")
        self.gdbProc.stdin.flush()
#        self.openocdwin.buffer.append('added')
#        self.nvim.command('echo 3')

    @pynvim.function('TestFunction4')
    def testfunction4(self, args):
        self.gdbProc.stdin.write('montor reset halt'.encode("utf8") + b"\n")
        self.gdbProc.stdin.flush()
#        self.openocdwin.buffer.append('added')
#        self.nvim.command('echo 3')

    @pynvim.function('TestFunction5')
    def testfunction5(self, args):
        self.gdbProc.stdin.write('load'.encode("utf8") + b"\n")
        self.gdbProc.stdin.flush()
#        self.openocdwin.buffer.append('added')
#        self.nvim.command('echo 3')

    @pynvim.function('TestFunction6')
    def testfunction6(self, args):
        string = 'abcd'
        self.nvim.current.window.buffer.append(string, -1)
        time.sleep(1)
        self.nvim.command('2d')
        time.sleep(1)
        string = string + 'e'
        self.nvim.current.window.buffer.append(string, -1)
        time.sleep(1)
        self.nvim.command('2d')
        time.sleep(1)
        string = string + 'f'
        self.nvim.current.window.buffer.append(string, -1)


    



    @pynvim.function('TestFunction')
    def testfunction(self, args):
        self.currwin = self.nvim.current.window

        self.nvim.command("split openocdmessage")
        self.openocdwin = self.nvim.current.window

        self.nvim.command("vsplit gdbmessage")
        self.gdbwin = self.nvim.current.window

        self.nvim.current.window = self.currwin

#        self.nvim.async_call(self.messageWriteWin)

        #self.nvim.current.buffer.append(['abcde'])
        #return self.nvim.current.buffer.__len__()
        #return 3
        OPENOCD_EXECUTABLE = os.environ['ECLIPSE_OPENOCD_BIN_DIR'] + r'\openocd'
         
        FW_WORKSPACE_ROOT = r'C:\Users\mm07860\workspace\gohei_system4\FW'
        os.chdir(FW_WORKSPACE_ROOT)
        
        self.openocdProc = sp.Popen(OPENOCD_EXECUTABLE + r' -f .\stlink.cfg -f .\stm32f4x.cfg', stdout=sp.PIPE, stdin=sp.PIPE, stderr=sp.PIPE)

        GDB_EXECUTABLE = os.environ['ARM_NONE_EABI_TOOLS_DIR'] + r'\arm-none-eabi-gdb'


        self.gdbProc = sp.Popen(GDB_EXECUTABLE + r' .\build\gohei_system4_FW.elf', stdout=sp.PIPE, stdin=sp.PIPE, stderr=sp.PIPE)
        
        #while openocdRunFlag == True:
        #    #sys.stdout.write(openocdProc.stderr.readline().decode())
        #    #openocdwin.buffer.append(openocdProc.stderr.readline().decode())
        #    openocdwin.buffer.append('abcdefghij')
        #    time.sleep(1)

        thread_openocd = threading.Thread(target = self.openocdThread)
        thread_gdb = threading.Thread(target = self.gdbThread)


        thread_openocd.start()
        thread_gdb.start()


        #self.nvim.async_call(openocdThread, openocdProc)
        
        #self.nvim.async_call(gdbThread, gdbProc)
        #openocdwin.buffer.append('abcdefghij')

#        time.sleep(2)
#
#        gdbProc.stdin.write('target remote localhost:3333'.encode("utf8") + b"\n")
#        gdbProc.stdin.flush()
#        time.sleep(1)
#        gdbProc.stdin.write('interrupt'.encode("utf8") + b"\n")
#        gdbProc.stdin.flush()
#        time.sleep(1)
#        gdbProc.stdin.write('monitor reset halt'.encode("utf8") + b"\n")
#        gdbProc.stdin.flush()
#        time.sleep(1)
#        gdbProc.stdin.write('load'.encode("utf8") + b"\n")
#        gdbProc.stdin.flush()
#        time.sleep(5)




#        time.sleep(5)

        
       
        #thread_openocd = threading.Thread(target = openocdThread, args=[openocdProc])
        
        #thread_openocd.start();
#        try:
#            openocdProc.wait()
#        
#            openocdRunFlag = False
#        
#            openocdProc.kill()
#        except KeyboardInterrupt:
#            openocdRunFlag = False
#        
#            openocdProc.kill()
#        
#            sys.exit()



    openocdRunFlag = True
    #openocdMessageLineReady = False
    #openocdMessageLineBuf = ""
#    openocdMessageLineQueue = queue.Queue()

    def openocdThread(self):
        while self.openocdRunFlag == True:
            #sys.stdout.write(openocdProc.stderr.readline().decode())
            #strToIndicate = openocdProc.stderr.readline().decode().splitlines()
            #self.async_call(openocdwin.buffer.append, [strToIndicate])
            #openocdwin.buffer.append(openocdProc.stderr.readline().decode().splitlines())
            #openocdwin.buffer.append(['abcde'])
    #        if self.openocdMessageLineReady == False:
            messageLineStr = self.openocdProc.stderr.readline().decode().splitlines()
                #self.openocdMessageLineBuf = openocdProc.stderr.readline().decode().splitlines()
                #self.openocdMessageLineReady = True
#            self.openocdMessageLineQueue.put(messageLineStr)
            self.nvim.async_call(self.writeToOpenocdWin, messageLineStr)
#           time.sleep(1.5)
#           if self.openocdMessageLineReady == False:
#                self.openocdMessageLineBuf = "openocdABC"
#                self.openocdMessageLineReady = True

    def writeToOpenocdWin(self, message, index=-1):
        self.openocdwin.buffer.append(message, index)

    def addToGdbWin_wo_newline(self, message):
        existingStr = str(self.gdbwin.buffer.request('nvim_buf_get_lines', -2, -1, True)[0])

        strToReWrite = existingStr + str(message)

        self.gdbwin.buffer.request('nvim_buf_set_lines', -2, -1, True, [strToReWrite]) 
    def writeToGdbWin(self, message, index):
#        strIndex = 'echo ' + str(index)
#        strIndex = 'echo ' + '\'' + message + str(index) + '\''
#        self.nvim.command(strIndex)
        if index != 0:
#            self.nvim.command('echo \'keep line\'')
#            self.nvim.current.window = self.gdbwin
#            self.nvim.command('2d')
#            self.nvim.current.window = self.currwin
            self.gdbwin.buffer.request('nvim_buf_set_lines', index - 1, index, True, [message]) 

#            strToSend = self.gdbwin.buffer.request('nvim_buf_get_lines', index - 1, index, True)[0] 
            
#            self.nvim.command('echo ' + '\'' + strToSend + '\'')
        else:
#            self.nvim.command('echo \'new line\'')
#        self.gdbwin.buffer.request('nvim_buf_set_lines', index, index, False, message)
#            self.gdbwin.buffer.append(message)
#            self.gdbwin.buffer.append("abcde")
#            self.gdbwin.buffer.append("abcde")
            self.gdbwin.buffer.append("")
#            self.gdbwin.buffer.request('nvim_buf_set_lines', index, index + 1, True, [message]) 

    gdbRunFlag = True
    #gdbMessageLineReady = False
    #gdbMessageLineBuf = ""
#    gdbMessageLineQueue = queue.Queue()
    def gdbThread(self):
        strLine = ""
        strLinePos = -1
        while self.gdbRunFlag == True:
            out = self.gdbProc.stdout.read(1)
            self.gdbProc.stdout.flush()
            if out == '' and self.gdbProc.poll() != None:
                break
            if out != '':
                if out.decode() != '\r' and out.decode() != '\n' and out.decode() != '^M':
                    strLine = strLine + out.decode()
#                    strLine = out.decode()
                    self.nvim.async_call(self.writeToGdbWin, strLine, strLinePos)
                    strLinePos = -1
                else :
#                strLine.find("\r\n") >= 0:
#                self.gdbMessageLineQueue.put(strLine.splitlines())
#                self.nvim.async_call(self.writeToGdbWin, strLine.splitlines())
    #                self.gdbMessageLineBuf = strLine.splitlines()
    ##                self.gdbMessageLineReady = True
                    strLine = ""
#                    self.nvim.async_call(self.writeToGdbWin, strLine, strLinePos)
                    strLinePos = 0
#            self.nvim.async_call(self.writeToGdbWin, strLine, strLinePos)
#            time.sleep(0.2)

        #    #gdbwin.buffer.append(out.decode().splitlines())
#        while self.gdbRunFlag == True:
#            #gdbwin.buffer.append(['abcde'])
#            time.sleep(1)
#            if self.gdbMessageLineReady == False:
#                self.gdbMessageLineBuf = "gdbABC"
#                self.gdbMessageLineReady = True

    def messageWriteWin(self):
        self.openocdwin.buffer.append('openocd dayo')
        self.gdbwin.buffer.append('gdb dayo')
        while True:
            if not self.openocdMessageLineQueue.empty():
                self.openocdwin.buffer.append(self.openocdMessageLineQueue.get())

            if not self.gdbMessageLineQueue.empty():
                self.gdbwin.buffer.append(self.gdbMessageLineQueue.get())
#            if self.openocdMessageLineReady == True:
#                self.openocdMessageLineReady = False
#                openocdwin.buffer.append(self.openocdMessageLineBuf)
#            if self.gdbMessageLineReady == True:
#                self.gdbMessageLineReady = False
#                gdbwin.buffer.append(self.gdbMessageLineBuf)




    @pynvim.command('TestCommand', nargs='*', range='')
    def testcommand(self, args, range):
        self.nvim.current.line = ('Command with args: {}, range: {}'.format(args, range))

