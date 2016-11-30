exports = (typeof window === 'undefined') ? global : window;

exports.stringsAnswers = {
  reduceString: function(str, amount) {
    var re = new RegExp("(.)(?=\\1{" + amount + "})","g");
    return str.replace(re, "");
  },

  reverseString: function(str) {
    var s = '';
    for (var i = str.length - 1; i >= 0; i--) {
      s += str[i];
    }
    return s;
  }
};
