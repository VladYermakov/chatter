$(document).ready ->
  if $('#page').html() == 'messages'
    App.chat = App.cable.subscriptions.create "ChatChannel",
      received: (data) ->
        $('#messages').append(data.message)

      speak: (msg) ->
        @perform 'speak', message: msg

  $('#chat-speak').on 'keypress', (event) ->
    if event.keyCode is 13
      App.chat.speak(event.target.value)
      event.target.value = ""
      event.preventDefault()
