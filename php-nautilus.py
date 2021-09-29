from gi import require_version
require_version('Gtk', '3.0')
require_version('Nautilus', '3.0')
from gi.repository import Nautilus, GObject
from subprocess import call
import os

# path to vscode
PHPSTORM = '/opt/PhpStorm-212.5284.49/bin/phpstorm.sh'

# what name do you want to see in the context menu?
DISPLAYNAME = 'PhpStorm'

# always create new window?
NEWWINDOW = False


class PhpStormExtension(GObject.GObject, Nautilus.MenuProvider):

    def launch_phpstorm(self, menu, files):
        safepaths = '' 

        for file in files:
            filepath = file.get_location().get_path()
            safepaths += '"' + filepath + '" '

            # If one of the files we are trying to open is a folder
            # create a new instance of vscode
            # if os.path.isdir(filepath) and os.path.exists(filepath):
            #     args = '--new-window '

        # if NEWWINDOW:
        #     args = '--new-window '

        call(PHPSTORM + ' ' + safepaths + '&', shell=True)

    def get_file_items(self, window, files):
        item = Nautilus.MenuItem(
            name='PhpStormOpen',
            label='Open in ' + DISPLAYNAME,
            tip='Opens the selected files with PhpStorm'
        )
        item.connect('activate', self.launch_phpstorm, files)

        return [item]

    def get_background_items(self, window, file_):
        item = Nautilus.MenuItem(
            name='PhpStormOpenBackground',
            label='Open in ' + DISPLAYNAME,
            tip='Opens the current directory in PhpStorm'
        )
        item.connect('activate', self.launch_phpstorm, [file_])

        return [item]

