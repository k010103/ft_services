#!/bin/sh

ps | grep nginx | grep -v grep
return $?
