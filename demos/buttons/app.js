(function() {
  var App;
  App = SC.Application.create();
  App.Button = SC.View.extend({
    tagName: "button",
    mouseEnter: function(event) {
      console.log('I am here');
      return false;
    }
  });
  App.AnchorView = SC.View.extend({
    href: "#",
    title: "Hello",
    defaultTemplate: SC.Handlebars.compile('<a {{bindAttr href="href"}}>{{title}}</a>'),
    click: function(event) {
      alert('hello');
      return true;
    }
  });
  App.PeopleView = SC.View.extend({
    people: [
      SC.Object.create({
        name: 'Steph'
      }), SC.Object.create({
        name: 'Tom'
      })
    ]
  });
  window.App = App;
}).call(this);
