# # JQ.Button
# 
# Abstracted from Yehuda's example
# this adds icons to the Button Widget
# for jQuery UI
JQ.Button = SC.View.extend JQ.Widget, 
  uiType: "button"
  uiOptions: [ "label", "disabled" ]
  tagName: "button"
  
  didInsertElement: ->
    @_super()
    @$().button
      icons:
        primary: @get('primary-icon')
        secondary: @get('secondary-icon')

#  # Handlebars Example with icons
#
#     {{view JQ.Button 
#       label="whats up" 
#       primary-icon="ui-icon-gear"
#       secondary-icon="ui-icon-triangle-1-s" }}
