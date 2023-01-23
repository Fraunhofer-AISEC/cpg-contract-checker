pragma solidity 0.8.0;
interface testInterface{
   function externalFunction(uint _test) external returns(bool);
}

contract abc{
    uint public var1;

    function testTryCatch() public {
        var1 = 22;
        try testInterface(address(0)).externalFunction(var1) {} catch {}
    }
}
