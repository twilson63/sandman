(function() {
  var get, set;
  get = SC.get;
  set = SC.set;
  SC.Anchor = SC.View.extend({
    href: '#',
    classNameBindings: ["isActive"],
    tagName: "a",
    attributeBindings: ["href"],
    targetObject:  function() {
    target = get(this, "target");
    if (SC.typeOf(target) == "string") {
      SC.getPath(this, target);
    } else {
      return target;
    }
  }.property("target").cacheable()
  ,
    mouseDown: function(event) {
      set(this, "isActive", true);
      this._mouseDown = true;
      this._mouseEntered = true;
      return false;
    },
    mouseLeave: function(event) {
      if (this._mouseDown) {
        set(this, "isActive", false);
        this._mouseEntered = false;
      }
      return false;
    },
    mouseEnter: function(event) {
      if (this._mouseDown) {
        set(this, "isActive", true);
        this._mouseEntered = true;
      }
      return false;
    },
    mouseUp: function(event) {
      var action, target;
      console.log('clicked anchor...');
      if (get(this, "isActive")) {
        action = get(this, "action");
        target = get(this, "targetObject");
        if (target && action) {
          if (typeof action === "string") {
            action = target[action];
          }
          action.call(target, this);
        }
        set(this, "isActive", false);
      }
      this._mouseDown = false;
      this._mouseEntered = false;
      return false;
    },
    touchStart: function(touch) {
      this.mouseDown(touch);
      return false;
    },
    touchEnd: function(touch) {
      this.mouseUp(touch);
      return false;
    }
  });
}).call(this);
