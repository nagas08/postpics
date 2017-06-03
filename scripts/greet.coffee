# Description:
#   挨拶をしてくれる機能です。
#
# Dependencies:
#   "<module name>": "<module version>"
#
# Configuration:
#   LIST_OF_ENV_VARS_TO_SET
#
# Commands:
#   hubot おはよう - "おはようございます！"と返答
#
# Notes:
#   sample
#
# Author:
#   Nagayuki Shimizu

module.exports = (robot) ->

  robot.respond /おはよう/i, (msg) ->
    msg.send "おはようございます！"
