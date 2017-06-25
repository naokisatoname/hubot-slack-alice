# Description
#   Allows hubot to update itself using git pull and restart process
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands:
#   hubot update - Performs a git pull and npm udate.
#
# Author:
# 

child_process = require 'child_process'

module.exports = (robot) ->

    robot.respond /update( self)?$/i, (msg) ->
        try
            msg.send "git pull..."
            child_process.exec 'git pull', (error, stdout, stderr) ->
                if error
                    msg.send "git pull failed: " + stderr
                else
                    output = stdout+''
                    if not /Already up\-to\-date/.test output
                        msg.send "Hubot changed:\n" + output + "\n"
                        process.exit()
                    else
                        msg.send "Hubot is up-to-date"
        catch error
            msg.send "git pull failed: " + error

