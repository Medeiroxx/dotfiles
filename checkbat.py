import os
from subprocess import run, PIPE
import re

battery_dir = '/sys/class/power_supply/BAT0'
status_file = os.path.join(battery_dir, 'status')

def get_status(status_file):
    current_status = run(
            ['cat', f'{status_file}'], stdout= PIPE)

    status_str = str(current_status.stdout)
    full_re         = re.compile('Full')
    discharging_re  = re.compile('Discharging')
    charging_re     = re.compile('Charging')

    if re.search(full_re, status_str):
        return 'Full'
    elif re.search(discharging_re, status_str):
        return '↓'
    elif re.search(charging_re, status_str):
        return '↑'

print(get_status(status_file))
    
