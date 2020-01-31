import os
import sys
import json

class SettingReader():
    def __init__(self, currentDirectory):
        os.chdir(currentDirectory)
        self._json_load = json.load(open('Nvim_arm_openocd_gdb_debug_settings.json', 'r'))
        self._selected_json_key = list(self._json_load.keys())[0]
    
    @property
    def effectiveItem(self):
        return self._selected_json_key

    @effectiveItem.setter
    def effectiveItem(self, value):
        self._selected_json_key = value

    @property
    def keyList(self):
        return json_load

    @property
    def projectRoot(self):
        return self._selected_json_key['ProjectRoot']

    @property
    def settingName(self):
        return self._selected_json_key['SettingName']

    @property
    def executable(self):
        return self._selected_json_key['Executable']

    @property
    def openocdExecutable(self):
        return self._selected_json_key['openocd_executable']

    @property
    def arm_none_eabi_gdb_Executable(self):
        return self._selected_json_key['arm-none-eabi-gdb_Executable']

    @property
    def openocd_script_files(self):
        return self._selected_json_key['popenocd_script_files']



        


