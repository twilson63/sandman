get = SC.get 
set = SC.set

SC.Anchor = SC.View.extend
  href: '#'
  classNameBindings: [ "isActive" ]
  tagName: "a"

#  # Handlebars Example with icons
#
#     {{view SC.Anchor 
#       label="whats up" 
#       primary-icon="ui-icon-gear"
#       secondary-icon="ui-icon-triangle-1-s" 
#       target="Some View or Controller"
#       action="Some Event"}}
