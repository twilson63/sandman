(function() {
  var JQ;
  JQ = {};
  JQ.Widget = SC.Mixin.create({
    didInsertElement: function() {
      var options, ui;
      this._super();
      options = this._gatherOptions();
      this._gatherEvents(options);
      console.log(options);
      console.log(this.get("element"));
      ui = this.$()[this.get("uiType")](options);
      return this.set("ui", ui);
    },
    willDestroyElement: function() {
      var observers, prop, ui;
      ui = this.get("ui");
      if (ui) {
        observers = this._observers;
        for (prop in observers) {
          if (observers.hasOwnProperty(prop)) {
            this.removeObserver(prop, observers[prop]);
          }
        }
        return ui._destroy();
      }
    },
    _gatherOptions: function() {
      var options, uiOptions;
      uiOptions = this.get("uiOptions");
      options = {};
      if (uiOptions != null) {
        uiOptions.forEach((function(key) {
          var observer;
          options[key] = this.get(key);
          observer = function() {
            var value;
            value = this.get(key);
            return this.get("ui")._setOption(key, value);
          };
          this.addObserver(key, observer);
          this._observers = this._observers || {};
          return this._observers[key] = observer;
        }), this);
      }
      return options;
    },
    _gatherEvents: function(options) {
      var self, uiEvents;
      uiEvents = this.get("uiEvents") || [];
      self = this;
      return uiEvents.forEach(function(event) {
        var callback;
        callback = self[event];
        if (callback) {
          return options[event] = function(event, ui) {
            return callback.call(self, event, ui);
          };
        }
      });
    }
  });
  if (typeof window !== "undefined" && window !== null) {
    window.JQ = JQ;
  }
}).call(this);
