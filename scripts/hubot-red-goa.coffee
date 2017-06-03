# Description
#  Display a random image from Riva's trip to Goa
#
# Configuration:
#   goa.json - List of URLs. Located at Hubot root.
#
# Commands:
#  hubot goa

fs = require 'fs'
urls = JSON.parse(fs.readFileSync('goa.json', 'utf8'))

module.exports = (robot) ->
  robot.respond /goa/i, (msg) ->
    msg.send (msg.random urls)
