#!/bin/bash

# Send a message via Slack
# 2021.02.22
#
# Emojis: https://www.webfx.com/tools/emoji-cheat-sheet/

text=${1}
username="$(hostname).user"
icon_emoji=":ghost:"
channel="#channel"
hook_path="/services/T00000000/B00000000/XXXXXXXXXXXXXXXXXXXXXXXX"

body="{\"username\":\"${username}\",\"icon_emoji\":\"${icon_emoji}\",\"channel\":\"${channel}\",\"text\":\"${text}\"}"

echo ${body}

echo -ne "POST ${hook_path} HTTP/1.0\r\nHost: hooks.slack.com\r\nContent-Type: application/json\r\nContent-Length: ${#body}\r\n\r\n${body}" | openssl s_client -quiet -CAfile Geotrust_PCA_G3_Root.pem -connect hooks.slack.com:443
