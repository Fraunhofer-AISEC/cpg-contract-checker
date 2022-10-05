pragma solidity ^0.6.0;
pragma experimental ABIEncoderV2;


contract Test  {

struct TestComplex{
address testValue;
address delegate;
uint testInt;
}

TestComplex[] public  testArray;


 function setTestArrayByPush( address _testValue, address _delegate, uint _testInt) public {
testArray.push(TestComplex(
   _testValue,
   _delegate,
   _testInt
) );
}

function getTestComplex () public view returns ( TestComplex[] memory)  {
return testArray ;
}
}