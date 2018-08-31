#!/bin/bash
export http_proxy=http://0.0.0.0:8080
export https_proxy=http://0.0.0.0:8080
export no_proxy=127.0.0.1,192.*.*.*
# Author: @kenzo0107

# Zabbix > Configuration > Action
#
# Default subject : PROBLEM alert - {TRIGGER.NAME} is {TRIGGER.STATUS}
# Default message :
# HOST: {HOST.NAME}
# TRIGGER_NAME: {TRIGGER.NAME}
# TRIGGER_STATUS: {TRIGGER.STATUS}
# TRIGGER_SEVERITY: {TRIGGER.SEVERITY}
# DATETIME: {DATE} / {TIME}
# ITEM_ID: {ITEM.ID1}
# ITEM_NAME: {ITEM.NAME1}
# ITEM_KEY: {ITEM.KEY1}
# ITEM_VALUE: {ITEM.VALUE1}
# EVENT_ID: {EVENT.ID}
# TRIGGER_URL: {TRIGGER.URL}
#
# Recovery subject : RECOVERY alert - {TRIGGER.NAME} is {TRIGGER.STATUS}
# Recovery message :
# HOST: {HOST.NAME}
# TRIGGER_NAME: {TRIGGER.NAME}
# TRIGGER_STATUS: {TRIGGER.STATUS}
# TRIGGER_SEVERITY: {TRIGGER.SEVERITY}
# DATETIME: {DATE} / {TIME}
# ITEM_ID: {ITEM.ID1}
# ITEM_NAME: {ITEM.NAME1}
# ITEM_KEY: {ITEM.KEY1}
# ITEM_VALUE: {ITEM.VALUE1}
# EVENT_ID: {EVENT.ID}
# TRIGGER_URL: {TRIGGER.URL}


# LINE Notify Token - Media > "Send to".
TOKEN="$1"

# {ALERT.SUBJECT}
subject="$2"

# {ALERT.MESSAGE}
message="$3"


# Line Notify notice message.
notice="
${subject}
[Host] ${host}
[Date Time] ${datetime}
[Status] ${trigger_status}
${item_name}: ${item_value}"

curl https://notify-api.line.me/api/notify -H "Authorization:Bearer ${TOKEN}" -d "message=${message}"
