JQ = {}
JQ.Widget = SC.Mixin.create
  didInsertElement: ->
    @_super()
    options = @_gatherOptions()
    @_gatherEvents options
    ui = this.$()[@get("uiType")](options)
    #ui = jQuery.ui[@get("uiType")](options, @get("element"))
    @set "ui", ui
  
  willDestroyElement: ->
    ui = @get("ui")
    if ui
      observers = @_observers
      for prop of observers
        @removeObserver prop, observers[prop]  if observers.hasOwnProperty(prop)
      ui._destroy()
  
  _gatherOptions: ->
    uiOptions = @get("uiOptions")
    options = {}
    if uiOptions?
      uiOptions.forEach ((key) ->
        options[key] = @get(key)
        observer = ->
          value = @get(key)
          @get("ui")._setOption key, value
      
        @addObserver key, observer
        @_observers = @_observers or {}
        @_observers[key] = observer
      ), this
    options
  
  _gatherEvents: (options) ->
    uiEvents = @get("uiEvents") or []
    self = this
    uiEvents.forEach (event) ->
      callback = self[event]
      if callback
        options[event] = (event, ui) ->
          callback.call self, event, ui


window.JQ = JQ if window? 
