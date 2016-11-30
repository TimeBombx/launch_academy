exports = (typeof window === 'undefined') ? global : window;

exports.regexAnswers = {
  containsNumber : function(str) {
    return /\d/g.test(str);
  },

  containsRepeatingLetter : function(str) {
    return /(\D)\1+/g.test(str);
  },

  endsWithVowel : function(str) {
    return /[aeiou]$/g.test(str.toLowerCase());
  },

  captureThreeNumbers : function(str) {
    reg = /\d{2}[0-9]/g.exec(str);
    if (reg != null) {
      return reg[0]
    } else {
      return false;
    }
  },

  matchesPattern : function(str) {
    return /^[2-9]\d{2}-\d{3}-\d{4}$/g.test(str);
  },

  isUSD : function(str) {
    return /^\$(\d{1,3}(\,\d{3})*|(\d+))(\.\d{2})?$/g.test(str);
  }
};
