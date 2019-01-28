const convertRomanToNumber = val => {
  function _charToInt(c) {
    switch (c) {
      case "I":
        return 1;
      case "V":
        return 5;
      case "X":
        return 10;
      case "L":
        return 50;
      case "C":
        return 100;
      case "D":
        return 500;
      case "M":
        return 1000;
      default:
        return -1;
    }
  }

  if (!isNaN(val)) return val;

  let num = _charToInt(val.charAt(0)),
    pre,
    curr;

  for (let i = 1; i < val.length; i++) {
    curr = _charToInt(val.charAt(i));
    pre = _charToInt(val.charAt(i - 1));
    if (curr <= pre) {
      num += curr;
    } else {
      num = num - pre * 2 + curr;
    }
  }

  return num;
};

module.exports = { convertRomanToNumber };
