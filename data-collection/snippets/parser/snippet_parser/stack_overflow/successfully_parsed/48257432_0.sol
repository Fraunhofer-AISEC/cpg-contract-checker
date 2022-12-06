struct TestComplex{
    address testValue;
    address delegate;
    uint testInt;
}
TestComplex[] testArray;
function setTestArrayByPush( address _delegate, address _testAddr, uint _testInt) public {
    testArray.push(TestComplex( {
       testValue:_testAddr,
       delegate: _delegate,
       testInt: _testInt
    } ));
}
