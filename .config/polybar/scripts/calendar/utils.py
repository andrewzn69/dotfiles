from pathlib import Path
import os
import json

ABS_PATH = Path(__file__).parent.absolute()
CACHE_DIR = os.path.join(os.environ["HOME"], ".cache", "wal")


def get_glade_file_path(name):
    '''
    Returns local glade file which are inside /ui folder.
    '''
    return os.path.join(ABS_PATH, 'ui', name)


def get_localevents_json_file():
    '''
    Returns local events json file.
    '''
    return os.path.join(ABS_PATH, 'events.json')


def get_wal_colors():
    '''
    Returns pywal colors, if pywal is used and colors are cached in Home directory.
    Otherwise returns a default color scheme.
    '''
    file_name = os.path.join(CACHE_DIR, "colors.json")
    if not os.path.exists(file_name):
        # load a default if not exists
        file_name = os.path.join(ABS_PATH, 'colors.json')
    with open(file_name) as file:
        j = json.load(file)
        return j["colors"]
