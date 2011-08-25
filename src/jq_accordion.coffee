# # JQ.Accordian
# 
JQ.Accordion = SC.View.extend JQ.Widget, 
  uiType: "accordion"
  uiOptions: [ 
    "disabled"
    "active"
    "animated"
    "autoHeight"
    "clearStyle"
    "collapsible"
    "event"
    "fillSpace"
    "header"
    "navigation"
    "icons"
  ]
  content: [{title:"Hello",body:"World"}]
  tagName: "div"
  #defaultTemplate: SC.Handlebars.compile("<h3>{{content.title}}</h3><div>{{content.body}}</div>")
  # didInsertElement: ->
  #   @_super()
    #@$().button
