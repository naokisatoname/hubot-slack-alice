# Description
#   Restart OS
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands:
#   hubot restart os - Restart OS.
#
# Author:
# 

child_process = require 'child_process'

module.exports = (robot) ->

  robot.respond /restart os?$/i, (msg) ->
    try
      msg.send "restart OS..."
      child_process.exec 'sudo shutdown -r now', (error, stdout, stderr) ->
        msg.send error if error?
        msg.send stdout if stdout?
        msg.send stderr if stderr?
    catch error
      msg.send "restart OS failed: " + error

