App = SC.Application.create()
App.Button = SC.View.extend
  tagName: "button"
  mouseEnter: (event) ->
    console.log 'I am here'
    false
    
App.AnchorView = SC.View.extend
  href: "#"
  title: "Hello"
  defaultTemplate: SC.Handlebars.compile('<a {{bindAttr href="href"}}>{{title}}</a>')
  click: (event) ->
    alert 'hello'
    true

App.PeopleView = SC.View.extend
  people: [
    SC.Object.create name: 'Steph'
    SC.Object.create name: 'Tom'
  ]

window.App = App 
