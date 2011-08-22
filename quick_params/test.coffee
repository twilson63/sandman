Woofs.NewWoof = SC.View.extend
  message: ''
  error: ''
  
  addWoof: ->
    if @get('message').length is 0
      @set 'error', 'You must enter a message'
    else
      @set 'error', ''
      Woofs.woofsController.pushObject Woofs.Woof.create
        message: @get 'message'
        user: 'Tom'


save: ( ->
  console.log = 'Save Data!'
).property('user','message')
