exports = (typeof window === 'undefined') ? global : window;

exports.arraysAnswers = {

  removeWithoutCopy : function(arr, item) {
    return arr.filter(function(element){
      return element != item
    });
  },

  append : function(arr, item) {
    arr.push(item)
    return arr
  },

  truncate : function(arr) {
    arr.pop();
    return arr
  },

  prepend : function(arr, item) {
    narr = [item]
    narr = narr.concat(arr);
    return narr;
  },

  curtail : function(arr) {
    arr.shift();
    return arr;
  },

  concat : function(arr1, arr2) {
    return arr1.concat(arr2);
  },

  insert : function(arr, item, index) {
    arr.splice(index, 0, item);
    return arr;
  },

  count : function(arr, item) {
    count = arr.filter(function(element){ return element == item });
    return count.length;
  },

  duplicates : function(arr) {
    var dupsCount = {}, result = [];

    for (var i = 0; i < arr.length; i++) {
      dupsCount[arr[i]] = 0;
    }

    for(var i = 0; i < arr.length; i++){
      dupsCount[arr[i]]++;
    }

    for (var key in dupsCount) {
      if (dupsCount[key] > 1)
        result.push(Number(key));
    }
    return result;
  },

  square : function(arr) {
    return arr.map(function(item){
      return Math.pow(item, 2);
    });
  },

  findAllOccurrences : function(arr, target) {
    indices = [];
    for (var i = 0; i < arr.length; i++) {
      if (arr[i] === target)
        indices.push(i);
    }
    return indices;
  }
};
