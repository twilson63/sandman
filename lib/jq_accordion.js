(function() {
  JQ.Accordion = SC.View.extend(JQ.Widget, {
    uiType: "accordion",
    uiOptions: ["disabled", "active", "animated", "autoHeight", "clearStyle", "collapsible", "event", "fillSpace", "header", "navigation", "icons"],
    content: [
      {
        title: "Hello",
        body: "World"
      }
    ],
    tagName: "div"
  });
}).call(this);
