# # JQ.ButtonSet 
# is a SproutCore View that 
# creates jquery ui radio buttons
JQ.ButtonSet = SC.View.extend JQ.Widget, 
  uiType: "buttonset"
  uiOptions: [ "enable", "disable" ]
  tagName: "div"
  change: (event) ->
    @_elementValueDidChange()
    false
      
  _elementValueDidChange: ->
    value = ($(input).val() for input in @$("input:checked"))
    @set "value", value

  _updateElementValue: `function() {
    this.$('input:checked').prop("checked","");
    this.get("value").forEach(function(item) {
      input = this.$("input[value=" + item + "]");
      input.prop("checked", "checked");
    });
    this.$().buttonset("refresh");
  }.observes("value") `


# Here is a sample handlebars template for radio buttons
#    
#   {{#view JQ.ButtonSet valueBinding="App.myController.value"}}
#    
#     <input type='radio' id='radio1' name="radio" value='y' {{bindAttr checked="checked"}}>
#     <label for="radio1">Hello</label>
#    
#     <input type='radio' id='radio2' name="radio" value='n' {{bindAttr checked="checked"}}>
#     <label for="radio2">World</label>
#    
#     <input type='radio' id='radio3' name="radio" value='z' {{bindAttr checked="checked"}}>
#     <label for="radio3">GoodBye</label>
#    
#     <input type='radio' id='radio4' name="radio" value='a' {{bindAttr checked="checked"}}>
#     <label for="radio4">Moon</label>
#    
#   {{/view}}
#   
# jQuery Ui Button set requires that the labels use the for id to connect to the input
# type and inorder for the ButtonSet to properly work you have to bindAttr to the 
# checked attribute.

# Here is a sample handlebars template for checkbox buttons
#    
#   {{#view JQ.ButtonSet valueBinding="App.myController.ckvalue"}}
#    
#     <input type='checkbox' id='checkbox1' name="checkbox" value='y' {{bindAttr checked="checked"}}>
#     <label for="checkbox1">Hello</label>
#    
#     <input type='checkbox' id='checkbox2' name="checkbox" value='n' {{bindAttr checked="checked"}}>
#     <label for="checkbox2">World</label>
#    
#     <input type='checkbox' id='checkbox3' name="checkbox" value='z' {{bindAttr checked="checked"}}>
#     <label for="checkbox3">GoodBye</label>
#    
#     <input type='checkbox' id='checkbox4' name="checkbox" value='a' {{bindAttr checked="checked"}}>
#     <label for="checkbox4">Moon</label>
#    
#   {{/view}}
#   
# jQuery Ui Button set requires that the labels use the for id to connect to the input
# type and inorder for the ButtonSet to properly work you have to bindAttr to the 
# checked attribute.
