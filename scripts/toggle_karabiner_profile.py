#!/usr/bin/env python
from os import path
import sys
import json

targetfile = path.expanduser('~/.config/karabiner/karabiner.json')

with open(targetfile) as settings_file:
    settings = json.load(settings_file)

active_index = next(index for (index, profile) in enumerate(settings['profiles']) if profile["selected"] == True)

# disable current active profile
settings['profiles'][active_index]['selected'] = False;

# set new active profile
next_profile = (active_index + 1) % len(settings['profiles'])
settings['profiles'][next_profile]['selected'] = True;

with open(targetfile, 'w') as settings_file:
    json.dump(settings, settings_file, indent=4, separators=(',', ': '))

sys.stdout.write(settings['profiles'][next_profile]['name'])
