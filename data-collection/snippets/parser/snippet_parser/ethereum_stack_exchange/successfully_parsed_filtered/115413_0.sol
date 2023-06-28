contract A {
    address bAddress;
    constructor(address b){
       bAddress = b;
    }
 
    function callHello() external view returns(string memory){
       B b = B(bAddress); 
       return b.sayHello();
    }
}
contract B {
     string greeting = "hello world";
     function sayHello() external view returns(string memory){
         return greeting;
     }
}
