contract simpleContract {

 function simpleContract() public {
 creator = msg.sender;
 }

 uint public value;

 function testingStateChannel(uint simpleValue){
 value=simpleValue;
 }

 function getSimpleValue() view public returns (uint){
  return value;
 }  
}  
