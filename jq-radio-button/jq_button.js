(function() {
  JQ.Button = SC.View.extend(JQ.Widget, {
    uiType: "button",
    uiOptions: ["label", "disabled"],
    tagName: "button",
    didInsertElement: function() {
      this._super();
      return this.$().button({
        icons: {
          primary: this.get('primary-icon'),
          secondary: this.get('secondary-icon')
        }
      });
    }
  });
}).call(this);
