
contract Parent {
 uint private myPrivateVar;

 
 function getMyPrivateVar() internal view returns (uint) {
     return myPrivateVar;
 }
}


contract Child is Parent {
 function doSomething() external {
     uint myVar = getMyPrivateVar();
     
 }
}

