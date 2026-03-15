class HelloWordService {
    /**
     * @description Create an instance of HelloWordService
     */
    constructor () {
      
    }
  
    /**
     * @description Says Hello to a given name
     * @param nameToHello {string} Name to greet
     * greet name
     * @returns a string that starts with Hello
     */
    greet ( nameToHello ) {

        return "Hello " + nameToHello+"!";
      
    }
  }
  
  module.exports = HelloWordService;