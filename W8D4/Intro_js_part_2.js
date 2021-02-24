function titleize(array, callback) {
    let newArr = array.map(function(ele) {
     return `Mx. ${ele} Jingleheimer Schmidt`;
    })

    callback(newArr);
};


function Elephant(name, height, tricks){ 
    this.name = name;
    this.height = height; 
    this.tricks = tricks; 

    this.paradeHelper = function() {
        console.log(`${this.name} is trotting by!`)
    };

    this.meow = function() {
        console.log("meow");
    };
};

Elephant.prototype.trumpet = function() { 
    console.log(`${this.name} goes 'phrRRRRRRRRRRRR!!!!!!!'`)
};

Elephant.prototype.grow = function() { 
    this.height += 12; 
};

Elephant.prototype.addTrick = function(trick) {
    this.trick.push(trick);
};

Elephant.prototype.play = function() {
    const randomTrick = this.tricks[Math.floor(Math.random() * this.tricks.length)];
    // Math.floor(Math.random() * array.length) returns a 
    // random integer between 0 and array length exclusive 
    // Math.floor() function returns the largest integer 
        // less than or equal to a given number.
    // Math.random() function returns a float, pseudo-random number
        // in the range 0 to less than 1(inclusive of 0, but not 1)
    console.log(`${this.name} is ${randomTrick}!`);
};

let ellie = new Elephant("Ellie", 185, ["giving human friends a ride", "playing hide and seek"]);
let charlie = new Elephant("Charlie", 200, ["painting pictures", "spraying water for a slip and slide"]);
let kate = new Elephant("Kate", 234, ["writing letters", "stealing peanuts"]);
let micah = new Elephant("Micah", 143, ["trotting", "playing tic tac toe", "doing elephant ballet"]);

let herd = [ellie, charlie, kate, micah];



function dinerBreakfast() {
    let order = "I'd like cheesy scrambled eggs please.";
    console.log(order);
// why isn't line 58 printing everytime you call it? 
  
    return function (food) {
        order = `${order.slice(0, order.length - 8)} and ${food} please.`;
        console.log(order);
    };
};

function testFunc() { 
    console.log('testing')

    return "this is the return";
};

// Private method with access to private variables: 

const makeCounter = function () {
    let privateCounter = 0;

    function changeBy(val) {
        privateCounter += val;
    }
    return {
        increment: function () {
            changeBy(1);
        },
        decrement: function () {
            changeBy(-1);
        },
        value: function () {
            return privateCounter;
        }
    }
};


// Public method with access to private variables:  

const counter = function () {
    let privateCounter = 0;

    function changeBy(val) {
        privateCounter += val;
    }
    return {
        increment: function () {
            changeBy(1);
        },
        decrement: function () {
            changeBy(-1);
        },
        value: function () {
            return privateCounter;
        }
    };
}();




function sumOfPrimes(n) {
    function isPrime(num) {
        for (i=2; i < num; i++){
            if (num % i === 0) return false;
        }
        return true;
    }

    function firstNPrimes(n) {
        const primes = [] 
        let i = 2  
        while (n>0) {
            if (isPrime(i)) {
                primes.push(i) 
                n--}
            i++  
        }
        return primes; 
    }

    let sum = 0 
    let primes = firstNPrimes(n) 
    primes.forEach(ele => sum += ele)
    return sum;
};