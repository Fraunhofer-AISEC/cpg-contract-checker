function setTestArrayByPush(address _testAddr, uint _testInt) public {
    testArray.push(TestComplex( {
       testValue:_testAddr,
       testInt: _testInt
       }));
    {
}
