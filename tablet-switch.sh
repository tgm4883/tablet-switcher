#!/bin/bash

mode=$1
echo $mode
if [ "$mode" = "tablet" ]; then
    notification='Switching to tablet mode'
    panel_size='0'
    latte-dock &
else
    notification='Switching to desktop mode'
    #panel_size='50' ## SP4
    panel_size='30'
    pkill latte-dock
fi

notify-send "$notification"
qdbus org.kde.plasmashell /PlasmaShell evaluateScript "p = panelById(panelIds[0]);
 p.height = $panel_size;"


##org.kde.plasma.kicker no
## org.kde.plasma.kickerdash  ## Dashboard
# qdbus org.kde.plasmashell /PlasmaShell evaluateScript "panel = panelById(panelIds[0]);
# panel.reloadConfig()
# "

#qdbus org.kde.kglobalaccel /component/kwin invokeShortcut ShowDesktopGrid
