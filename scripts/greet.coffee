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

module.exports = (robot) ->
  robot.hear /(おはよう)/i, (msg) ->

    msg.send 'https://www.dropbox.com/s/u3hssnlg8okdvsc/%E3%81%8C%E3%82%93%E3%81%B0%E3%82%8B%E3%81%9E%E3%81%84.jpg?dl=0'
