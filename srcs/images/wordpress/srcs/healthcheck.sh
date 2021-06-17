#!/bin/sh

ps | grep php-php7| grep -v grep
return $?
