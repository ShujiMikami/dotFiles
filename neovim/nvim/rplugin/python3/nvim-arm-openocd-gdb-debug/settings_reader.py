import os
import sys
import json

class SettingReader():
    def __init__(self, ):
        _json_load = json.load(open('Nvim_arm_openocd_gdb_debug_settings.json', 'r'))
        _selected_json_key = _json_load[0]
    
    @property
    def effectiveItem(self):
        return self._selected_json_key

    @effectiveItem.setter
    def effectiveItem(self, value):
        return self._selected_json_key = value

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



        


