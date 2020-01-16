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

import pynvim


@pynvim.plugin
class Nvim_arm_openocd_gdb_debug(object):
    def __init__(self, nvim):
        self.nvim = nvim

    @pynvim.function('TestFunction', sync=True)
    def testfunction(self, args):
        currwin = self.nvim.current.window

        self.nvim.command("split openocdmessage")
        openocdwin = self.nvim.current.window

        self.nvim.command("vsplit gdbmessage")
        gdbwin = self.nvim.current.window

        self.nvim.current.window = currwin

        openocdwin.buffer.append(['openocddayo'])
        gdbwin.buffer.append(['gdbdayo'])
        #self.nvim.current.buffer.append(['abcde'])
        #return self.nvim.current.buffer.__len__()
        #return 3

        openocdRunFlag = True
        def openocdThread(openocdProc):
            while openocdRunFlag == True:
                #sys.stdout.write(openocdProc.stderr.readline().decode())
                openocdwin.buffer.append(openocdProc.stderr.readline().decode().splitlines())
                #openocdwin.buffer.append(['abcde'])
                #time.sleep(1)


        OPENOCD_EXECUTABLE = os.environ['ECLIPSE_OPENOCD_BIN_DIR'] + r'\openocd'
         
        FW_WORKSPACE_ROOT = r'C:\Users\mm07860\workspace\gohei_system4\FW'
        os.chdir(FW_WORKSPACE_ROOT)
        
        openocdProc = sp.Popen(OPENOCD_EXECUTABLE + r' -f .\stlink.cfg -f .\stm32f4x.cfg', stdout=sp.PIPE, stdin=sp.PIPE, stderr=sp.PIPE)
        #while openocdRunFlag == True:
        #    #sys.stdout.write(openocdProc.stderr.readline().decode())
        #    #openocdwin.buffer.append(openocdProc.stderr.readline().decode())
        #    openocdwin.buffer.append('abcdefghij')
        #    time.sleep(1)

        self.nvim.async_call(openocdThread, openocdProc)
        #openocdwin.buffer.append('abcdefghij')
       
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





    @pynvim.command('TestCommand', nargs='*', range='')
    def testcommand(self, args, range):
        self.nvim.current.line = ('Command with args: {}, range: {}'.format(args, range))

