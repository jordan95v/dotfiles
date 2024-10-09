#!/bin/bash

mesg="This will open a new firefox window with the search prompt you enter. Press enter to search !"
rofi -dmenu -p "  Google Search " -mesg "$mesg" | xargs -I{} firefox --search {}