# # JQ.Slider
# 
JQ.Slider = SC.View.extend JQ.Widget, 
  uiType: "slider"
  uiOptions: [ "range", "value", "min", "max", "step", "orientation" ]
  tagName: "div"
  
  # didInsertElement: ->
  #   @_super()
    #@$().button
