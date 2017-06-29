# Description
#   Update OS
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands:
#   hubot update os - Performs apt-get update && apt-get upgrade.
#
# Author:
# 

child_process = require 'child_process'

module.exports = (robot) ->

  robot.respond /update os?$/i, (msg) ->
    try
      msg.send "apt-get update && apt-get upgrade..."
      child_process.exec 'sudo apt-get -y update && sudo apt-get -y upgrade', (error, stdout, stderr) ->
        msg.send error if error?
        msg.send stdout if stdout?
        msg.send stderr if stderr?
    catch error
      msg.send "apt-get update && apt-get upgrade failed: " + error

