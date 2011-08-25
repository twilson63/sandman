(function() {
  JQ.ButtonSet = SC.View.extend(JQ.Widget, {
    uiType: "buttonset",
    uiOptions: ["enable", "disable"],
    tagName: "div",
    change: function(event) {
      this._elementValueDidChange();
      return false;
    },
    _elementValueDidChange: function() {
      var input, value;
      value = (function() {
        var _i, _len, _ref, _results;
        _ref = this.$("input:checked");
        _results = [];
        for (_i = 0, _len = _ref.length; _i < _len; _i++) {
          input = _ref[_i];
          _results.push($(input).val());
        }
        return _results;
      }).call(this);
      return this.set("value", value);
    },
    _updateElementValue: function() {
    this.$('input:checked').prop("checked","");
    this.get("value").forEach(function(item) {
      input = this.$("input[value=" + item + "]");
      input.prop("checked", "checked");
    });
    this.$().buttonset("refresh");
  }.observes("value") 
  });
}).call(this);
