#!/bin/bash

export DESKTOP_SESSION=plasma
export KDEWM=/usr/bin/i3
exec startplasma-x11
exec systemctl --user start change-wallpaper.timer
