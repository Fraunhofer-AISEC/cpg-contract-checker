

pragma solidity 0.8.3;

contract Caller {
    event Response(bool success, bytes data);

    function testCallFoo(address payable _addr) public payable {
        
        (bool success, bytes memory data) = _addr.call{value: msg.value, gas: 50000}(
            abi.encodeWithSignature("foo(string,uint256)", "call foo", 123)
        );

        emit Response(success, data);
    }
    
    function testNotThere(address payable _addr) public payable {
        
        (bool success, bytes memory data) = _addr.call{value: msg.value, gas: 50000}("");

        emit Response(success, data);
    }

}
