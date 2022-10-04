contract Caller {

 function doSomething(address _callee, string _text) public {
   _callee.delegatecall(
                     bytes4(keccak256("validate(string)")), _text));

 
 }
}

contract Callee {

 function validate(string _text) public view {
  
  require(false);
 }
}
