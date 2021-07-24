/**
 * @param {string[]} strs
     |analyze inputs (strs)
        |create an array to store values from original strings
        |loop through words (inputs) to check individual letter patterns
            |loop through letters (individually)
                |store individual characters into seperate variable
                |store individual letters in seperate array created earlier
                |check if any letter patterns match previous words (even partially)
                |if there is a match, return the match
                    remove unique values (if an element occurs only once in the array, then remove from array)
                if no match, return " "
                |apply a set on the array to display unique values only
     return common prefix (or empty string)
 * @return {string}
 */

//test cases

const words = ["donkey", "donald", "domain", "dormant"]; //should return "do"
const moreWords = ["mister", "perriwinkle", "mustard", "cherri"]; //should return empty string
const niceWords = ["flower", "flow", "flight"]; //should return "fl"
const testWords = ["brown", "broman", "brownie", "bridge"]; //should return "br"
const notWords = ["a"]; //should return "a"
const weirdWords = ["b", "b"]; //should return "b"
const bigWords = ["volcano", "volatile", "volunteer", "volkswagen"]; //should return "vol"

const longestCommonPrefix = function (strs) {
  //create an array to store values from original strings
  const current = [];
  //loop through WORDS (inputs) to check individual letter patterns
  for (let i = 0; i < strs.length; i++) {
    //loop through LETTERS (individually)
    for (let j = 0; j <= strs[i].length; j++) {
      //store individual letters in seperate variable
      let letter = strs[i].charAt(j);
      //check for empty or single character strings
      if (strs.length <= 1) {
        current.push(letter);
        break
      }
      //this line tells the program not to run this code until after it runs the first word
      if (i > 0) {
        //stores the previous letters in a variable
        let prevLetter = strs[i - 1].charAt(j);
        //checks to see if the previous letter matches the current letter (strictly)
        if (letter === prevLetter) {
          //store individual (matching) letters in seperate array created earlier
          current.push(letter);
        } else {
          //tells the program to stop as soon as a letter doesn't fit the criteria
          break;
        }
      }
    }
  }
  //check for double letters (not duplicates)
  if (current[0] == current[1] || current.length < 2) {
    const newString = [...current].toString();
    //remove commas from string
    const finalString = newString.replace(/,/g, "");
    return finalString;
  } else {
    //takes the current array and passes it through a function that removes unique chars (letters that only occur once)
    const currentDupes = removeUnique(current, strs);
    //convert new set to an array and then into a string
    const newString = [...currentDupes].toString();
    //remove commas from string
    const finalString = newString.replace(/,/g, "");
    return finalString;
  }
};

//function that removes unique value from an array
const removeUnique = (arr, wordsArr) => {
  if (arr.length < 2) {
    const currentSet = new Set(arr);
    return currentSet;
  } else {
    //new array to store duplicates
    const newArr = [];
    //loop to iterate over all letters in array derived from original "words" array
    for (i = 0; i < arr.length; i++) {
      //count variable to keep up with repeat characters
      let count = 0;
      //second loop for checking values against original character value (i)
      for (j = 0; j < arr.length; j++) {
        //if value is the same, count is incremented by 1
        if (arr[i] == arr[j]) {
          count++;
        }
        //if the value is duplicated enough (count) it gets added to the array
        if (count == (wordsArr.length - 1)) {
          newArr.push(arr[i]);
        }
      }
    }

    //now apply a set on the current array to only display unique values
    const currentSet = new Set(newArr);
    return currentSet;
  }
};

//IFFE to run all test cases in one function
const testCase = (function () {
  console.log(longestCommonPrefix(words)); //should return "do"
  console.log(longestCommonPrefix(moreWords)); //should return empty string
  console.log(longestCommonPrefix(niceWords)); //should return "fl"
  console.log(longestCommonPrefix(testWords)); //should return "br"
  console.log(longestCommonPrefix(notWords)); //should return "a"
  console.log(longestCommonPrefix(weirdWords)); //should return "b"
  console.log(longestCommonPrefix(bigWords)); //should return "vol"
})();
