#!/bin/sh

# Send a message via Slack
# 2021.02.22
#
# Emojis: https://www.webfx.com/tools/emoji-cheat-sheet/

username="$(hostname).user"
icon_emoji=":ghost:"
channel="#channel"

hook_url="https://hooks.slack.com/services/T00000000/B00000000/XXXXXXXXXXXXXXXXXXXXXXXX"

curl -s -X POST --data-urlencode payload="{\"username\":\"${username}\",\"icon_emoji\":\"${icon_emoji}\",\"channel\":\"${channel}\",\"text\":\"$1\"}" ${hook_url} >/dev/null
