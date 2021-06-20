#!/bin/sh

ps | grep php-fpm7 | grep -v grep
return $?
