# Description:
#   Bruce Schneier awesomeness
#
# Dependencies:
#   "xml2js": "0.1.14"
#
# Configuration:
#   None
#
# Commands:
#   hubot schneier -- random Schneier awesomeness
#   hubot bruce -- random Schneier awesomeness
#
# Author:
#   alchemydc

xml2js = require('xml2js')

module.exports = (robot) ->

  robot.hear /schneier|bruce/i, (msg)->
    askBruce msg, "http://www.schneierfacts.com/rss/random"

  askBruce = (msg, url) ->
    msg.http(url)
      .get() (err, res, body) ->
      if err
        msg.send "Bruce Schneier says: #{err}"
      else
        parser = new xml2js.Parser()
        parser.parseString body, (err, result) ->
          if err
            msg.send "Got: #{err}"
            output = ""
          facts = []
          for fact in result.channel.item
            output =  "#{fact.description}"
            facts.push(output)
          msg.send msg.random facts