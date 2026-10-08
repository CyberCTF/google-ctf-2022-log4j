#!/bin/sh
# The chatbot repeats a message sent with its /repeat command.
set -e
curl -fsS -d 'text=/repeat isoloom' "http://web:1337/" | grep -q "isoloom"
