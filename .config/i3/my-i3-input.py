#!/bin/env python

import os
import argparse
import subprocess

parser = argparse.ArgumentParser(description="Use rofi's dmenu UI to implement i3-input")
parser.add_argument('-F', '--format', help="example: rename workspace to \"%%s\"")
parser.add_argument('-P', '--prompt')
arg = parser.parse_args()
# print("format=%s" % arg.format)
# print("prompt=%s" % arg.prompt)
if (arg.prompt is None):
	arg.prompt = "Input"
if (arg.format is None):
	parser.print_help()
	exit(1)

# get user input
res = subprocess.Popen("rofi -dpi 1 -dmenu -lines 0 -separator-style none -p \"%s\"" % arg.prompt, shell=True, stdout=subprocess.PIPE, stderr=subprocess.PIPE, close_fds=True)
user_input = str(res.stdout.read(), 'utf-8').strip()
# print("user input:", user_input)

# get i3-msg command
i3_command = str(arg.format) % user_input
# print('i3 command:', i3_command)

# run i3-msg
res = os.system("i3-msg '%s'" % i3_command)
exit(res)
