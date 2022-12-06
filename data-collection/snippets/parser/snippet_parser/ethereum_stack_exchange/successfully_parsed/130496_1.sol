contract Caller {

function callTestPayable(TestPayable test) public returns (bool) {
    (bool success,) = address(test).call(abi.encodeWithSignature("nonExistingFunction()"));
    require(success);
    
    (success,) = address(test).call{value: 1}(abi.encodeWithSignature("nonExistingFunction()"));
    require(success);
    
    return true;
}
}
