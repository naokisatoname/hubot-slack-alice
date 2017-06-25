# Description
#   Allows hubot to update itself using git pull and restart process
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Author:
# 

child_process = require 'child_process'

module.exports = (robot) ->

  robot.respond /restart( self)?$/i, (msg) ->
    try
      msg.send "restart Hubot..."
      child_process.exec 'sudo service hubot restart', (error, stdout, stderr) ->
        msg.send error if error?
        msg.send stdout if stdout?
        msg.send stderr if stderr?
    catch error
      msg.send "restart Hubot failed: " + error

