# Description
#   Hubot response samples
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Author:
#   Sato, Naoki <mail@naoki.sato.name>
#

module.exports = (robot) ->
  robot.respond /hello|ハロー|はろー/, (msg) ->
    replies = [
      'コンニチハー',
      'アリガト'
    ]
    reply = msg.random replies
    msg.send "#{reply}"
    
  robot.respond /goodbye (.*)/, (msg) ->
    name = msg.match[1]
    msg.send "コンニチハー #{name}"

