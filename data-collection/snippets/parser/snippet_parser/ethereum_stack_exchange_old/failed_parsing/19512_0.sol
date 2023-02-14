contract B {
   function myFuncB(address address) constant returns(address) {
        return address;
        
   }    
}


import "./B.sol";
contract A {
   function myFuncA() {
    var obj = new B(msg.sender);
    obj.myFuncB();
   }    
}
