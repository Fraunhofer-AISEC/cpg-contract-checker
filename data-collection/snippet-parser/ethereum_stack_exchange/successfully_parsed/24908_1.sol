contract B {
    function testSend1(address _contract, address _to, uint256 _value) {
        _contract.call.gas(400000)(bytes4(keccak256("testFunc1(address,uint256)")), _to, _value);
    }
    function testSend2(address _contract, address _to, uint256 _value) {
        _contract.call.gas(400000)(bytes4(keccak256("testFunc2(address,uint256)")), _to, _value);
    }
}
