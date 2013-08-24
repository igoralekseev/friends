#models
Messages = new Meteor.Collection("messages")

#client
if Meteor.isClient

  Template.chat.message = ->
    Messages.find()
  
  Template.chat.rendered = ->
    list = $ @find '.list'
    last = list.find('.item:last')
    lastPos = last.position()
    
    if lastPos
      list[0].scrollTop += lastPos.top + last.height()

  Template.chat.events
    'keyup textarea': (event, template) ->
      if event.keyCode is 13 #enter
        t = template.find('textarea')
        Messages.insert text: t.value
        t.value = ''

#server
# if Meteor.isServer
  # Meteor.startup ->
    # code to run on server at startup
  
  # Meteor.publish "all-rooms", ->
  #   Messages.find()
  


