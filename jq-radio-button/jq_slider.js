(function() {
  JQ.Slider = SC.View.extend(JQ.Widget, {
    uiType: "slider",
    uiOptions: ["range", "value", "min", "max", "step", "orientation"],
    tagName: "div"
  });
}).call(this);
