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
const words = ["donkey", "donald", "domain", "dormant"]; //should return "do"
const moreWords = ["mister", "perriwinkle", "mustard", "cherri"]; //should return empty string
const lastWords = ["flower","flow","flight"]; //should return "fl"
const testWords = ["brown","broman","brownie", "bridge"]; //should return "br"
const rareWords = ["a"]; //should return "a"

//function that removes unique value from an array
const removeUnique = (arr) => {
    //new array to store duplicates
    const newArr = [];
    for (i = 0; i < arr.length; i++) {
        let count = 0;
        //second loop for checking values against each other
        for (j = 0; j < arr.length; j++) {
            //if value is the same, count is incremented by 1
            if (arr[j] == arr[i]) {
                count ++;
            }
            //if the value is duplicated enough (count) it gets added to the array
            if (count >= 2) {
                // console.log(arr)
                newArr.push(arr[i]);
            }
        }
    }
    // console.log(newArr)

    //now apply a set on the current array to only display unique values
    const currentSet = new Set(newArr)
    // console.log(currentSet)
    return currentSet
};

const longestCommonPrefix = function (strs) {
  //create an array to store values from original strings
  const current = [];
  //loop through words (inputs) to check individual letter patterns
  for (let i = 0; i < strs.length; i++) {
    //loop through letters (individually)
    for (let j = 0; j < strs[i].length; j++) {
      //store individual letters in seperate variable
      let letter = strs[i].charAt(j);
      //this line tells the program not to run this code until it after it runs the first word
      if (i > 0) {
        //stores the previous letters in a variable
        let prevLetter = strs[i - 1].charAt(j);
        //checks to see if the previous letter matches the current letter
        if (letter == prevLetter) {
            //store individual (matching) letters in seperate array created earlier
            current.push(prevLetter);
          } else {
              //tells the program to stop as soon as a letter doesn't fit the criteria
              break
          }
      }
    }
  }
  const currentDupes = removeUnique(current);
  //convert new set to an array and then into a string
  const commonSet = [...currentDupes].toString()
  //remove commas from string
  const finalString = commonSet.replace(/,/g,"")
  console.log(finalString)
  return finalString
};

const testCase = (function () {
    console.log(longestCommonPrefix(words));
    console.log(longestCommonPrefix(moreWords));
    console.log(longestCommonPrefix(lastWords));
    console.log(longestCommonPrefix(testWords));
    console.log(longestCommonPrefix(rareWords));
})();
