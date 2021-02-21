function madLib(verb, adj, noun) {
    return `We shall ${verb.toUpperCase()} the ${adj.toUpperCase()} ${noun.toUpperCase()}.`
};

console.log(madLib('make','best','guac'))

// function isSubstring(searchString, subString) { 
//     for (i = 0; i < (searchString.length - subString.length); i++) {
//         if (searchString.slice(i, (i+subString.length)) === subString) {
//             return true
//         }
//     }
//     return false
// };

const isSubstring = (searchString, subString) => {return searchString.includes(subString)}

console.log(isSubstring("time to program", "time"))
console.log(isSubstring("Jump for joy", "joys"))

function fizzBuzz(array) {
    const newArr = Array() 
    for (i=0; i<array.length; i++) {
        const ele = array[i];
        if ((ele % 5 === 0 || ele % 3 === 0) && 
           !(ele % 3 === 0 && ele % 5 === 0)) {
            newArr.push(ele);
        }
    }
    return newArr ;
};

const makeArr = function(n) { 
    arr = [] 
    for (i=0;i<=n;i++) {
        arr.push(i)
    }
    return arr 
}

console.log(fizzBuzz(makeArr(50)))

function isPrime(num) {
    for (i = 2; i<num ; i++) {
        if (num%i===0) return false;
    }
    return true;     
};

console.log(isPrime(2))
console.log(isPrime(10))
console.log(isPrime(15485863))
console.log(isPrime(3548563))

function sumOfNPrimes(n) {
    let currSum = 0 
    let i = 2 
    while (n > 0) {
        if (isPrime(i)) {
            currSum += i 
            n-- 
        }
        i++
    }
    return currSum
};

console.log(sumOfNPrimes(0))
console.log(sumOfNPrimes(1))
console.log(sumOfNPrimes(4))