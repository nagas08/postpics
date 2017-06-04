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

fs = require 'fs'
urls = JSON.parse(fs.readFileSync('pic_all.json', 'utf8'))
m_urls = JSON.parse(fs.readFileSync('morning.json', 'utf8'))


module.exports = (robot) ->

  robot.hear /おはよう/i, (msg) ->
    msg.send (msg.random m_urls)
    msg.send "おはようございます！"

  robot.respond /goa/i, (msg) ->
    msg.send (msg.random urls)

  robot.hear /(がんば)/i, (msg) ->
    msg.send('https://dl.dropboxusercontent.com/sh/3h4poeiui7vcbkt/AABTP7JSqp5qCVQ-MhaO8SBWa/%EF%BC%81%EF%BC%81.jpg')

  robot.hear /バルス/i, (msg) ->
    msg.send('https://gifmagazine.net/gifs/7175?locale=ja')
    setTimeout ->
      msg.send('https://gifmagazine.net/gifs/7008?locale=ja')
    , 3000


