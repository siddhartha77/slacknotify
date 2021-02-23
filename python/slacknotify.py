#!/usr/bin/python

# Send a message via Slack
# 2021.02.22
#
# Emojis: https://www.webfx.com/tools/emoji-cheat-sheet/

import argparse
import socket
import sys
import os
from subprocess import call

hostname=socket.gethostname()

default_username=hostname + '.user'
default_icon_emoji=':ghost:'
default_channel='#channel'

hook_url='https://hooks.slack.com/services/T00000000/B00000000/XXXXXXXXXXXXXXXXXXXXXXXX'

parser = argparse.ArgumentParser(description='Send Slack notifications')

parser.add_argument('-u', '--username', action='store', default=default_username, help="The sender")
parser.add_argument('-i', '--icon_emoji', action='store', default=default_icon_emoji, help="The sender's emoticon")
parser.add_argument('-c', '--channel', action='store', default=default_channel, help="The receiving #channel or @username")
parser.add_argument('message', action='store', default=sys.stdin, nargs='?', help="The message to send")

args = parser.parse_args()

if hasattr(args.message, 'read'):
	with args.message as messagefile:
		message=messagefile.read()
else:
	message=args.message

devnull = open(os.devnull, 'w')

call(['curl', 
	'-s', 
	'-X',
	'POST', 
	'--data-urlencode',
	'payload={"username":"%s","icon_emoji":"%s","channel":"%s","text":"%s"}' % (
		args.username,
		args.icon_emoji,
		args.channel,
		message
	),
	hook_url], stdout=devnull)
