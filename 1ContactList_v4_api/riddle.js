// for(var i=0; i<10; i++) {
//   var countNum = function(x) { // anonymous
//     setTimeout(function() {
//       console.log(x);
//     },1000)
//   };
//   console.log("bam");
//   countNum(i);
// }

// function namedFunc(param) {
//   //
// }

// var func = function(param) { // anonymous assigned to variable
//   // blah
// }

// function riddle2() {
//   console.log(arguments);
//   console.log(arguments.callee);
//   console.log(riddle2.caller)
// }

// function three() {
//   riddle2("a", 1, null);
// }

// three();

// console.log(undefined == null);
// console.log(undefined === null);

// boolean
// string
// integer
// float
// undefined (null)
// NaN


// boolean
// string
// number
// undefined
// null

// console.log(typeof NaN === 'number')

var Human = function() {
  var firstName = "Phil";
  var age = 40;               // private / member variable
  var isVirgin = true;

  this.hairColor = "Brown"; // (public) variable / attribute

  // this.getName = function() {  // public function
  //   return "Winston";
  // }

  this.getRealName = function() { // priviledged method
    return firstName;
  }

  this.getAge = function() { // priviledged method
    return age;
  }

  getVirginity  = function() { // private method
    return isVirgin;
  }

  console.log(getVirginity());
};

Human.prototype.getName = function() {
  return "Winston";
}

// Human.getName = function() {
//   return "Winston";
// }

var human = new Human();
human.getName = function() {
  return "Roxanne";
}

//console.log(human.hairColor);
//console.log(human.firstName);
// console.log(human.getName)
console.log(human.getName() );
//console.log(human.getAge());
//console.log(human.getVirginity);
// human();
console.log(human.getRealName());