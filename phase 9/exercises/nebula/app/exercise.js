exports = (typeof window === 'undefined') ? global : window;

/**
 * This file defines an object with some methods. Some of these methods are
 * populated incorrectly; your job is to fix them. Other methods are not
 * populated at all; your job is to fill them out.
 */

exports.eveningExerciseAnswers = {
  indexOf : function(arr, item) {
    return arr.indexOf(item);
  },

  sum : function(arr) {
    sum = 0;
    for(i = 0; i < arr.length; i++) {
      sum += arr[i]
    }
    return sum;
  },

  remove : function(arr, item) {
    return arr.filter(function(element){
      return element != item
    })
  },

  reverseString : function(str) {
    var s = '';
    for (var i = str.length - 1; i >= 0; i--) {
      s += str[i];
    }
    return s;
  },

  longestSubString : function(str) {
    arr = str.split(" ");
    return arr.sort(function(a, b) {
        if (a.length > b.length) return -1;
        if (a.length < b.length) return 1;
        return 0
      })[0];
  },

  letterMoveForward : function(str) {
    newString = ""
    for(i = 0; i < str.length; i++) {
      charCode = str.charCodeAt(i);

      if (charCode >= "a".charCodeAt(0) &&
          charCode <= "z".charCodeAt(0))
        charCode += 1;

      if (charCode > 122) charCode = "a".charCodeAt(0);

      newString += String.fromCharCode(charCode)
    }
    return newString
  },

  capitalizeWords : function(str) {
    arr = str.split(" ");
    for(i = 0; i < arr.length; i++) {
      string = arr[i][0].toUpperCase();
      string += arr[i].slice(1, arr[i].length)
      arr[i] = string;
    }
    return arr.join(" ");
  }
};