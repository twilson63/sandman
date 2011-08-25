# # JQ.Button
# 
# Abstracted from Yehuda's example
# this adds icons to the Button Widget
# for jQuery UI
get = SC.get 
set = SC.set

JQ.Button = SC.View.extend JQ.Widget, 
  uiType: "button"
  uiOptions: [ "label", "disabled" ]
  classNameBindings: [ "isActive" ]
  tagName: "button"
  attributeBindings: [ "type" ]
  type: "button"
  targetObject: ` function() {
    target = get(this, "target");
    if (SC.typeOf(target) == "string") {
      SC.getPath(this, target);
    } else {
      return target;
    }
  }.property("target").cacheable()
  `
  mouseDown: (event) ->
    set this, "isActive", true
    @_mouseDown = true
    @_mouseEntered = true
    false

  mouseLeave: (event) ->
    if @_mouseDown
      set this, "isActive", false
      @_mouseEntered = false
    false

  mouseEnter: (event) ->
    if @_mouseDown
      set this, "isActive", true
      @_mouseEntered = true
    false

  mouseUp: (event) ->
    if get(this, "isActive")
      action = get(this, "action")
      target = get(this, "targetObject")
      if target and action
        action = target[action]  if typeof action == "string"
        action.call target, this
      set this, "isActive", false
    @_mouseDown = false
    @_mouseEntered = false
    false

  touchStart: (touch) ->
    @mouseDown touch
    false

  touchEnd: (touch) ->
    @mouseUp touch
    false

#  # Handlebars Example with icons
#
#     {{view JQ.Button 
#       label="whats up" 
#       primary-icon="ui-icon-gear"
#       secondary-icon="ui-icon-triangle-1-s" 
#       target="Some View or Controller"
#       action="Some Event"}}
