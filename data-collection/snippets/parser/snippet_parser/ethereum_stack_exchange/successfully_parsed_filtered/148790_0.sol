
pragma solidity ^0.8.17;

contract Receiver {
    event Received(address caller, uint amount, string message);

    fallback() external payable {
        emit Received(msg.sender, msg.value, "Fallback was called");
    }

    function foo(address payable _addr, uint amount) public payable returns (uint) {
        (bool success, bytes memory data) = _addr.call{value: amount, gas: 5000}("");
        emit Received(msg.sender, msg.value, "_message");

        return amount;
    }
}

contract Caller {
    event Response(bool success, bytes data);

    
    
    function testCallFoo(address payable _addr, address to) public {
        
        (bool success, bytes memory data) = _addr.call{ gas: 5000}(
            abi.encodeWithSignature("foo(address,uint256)", payable(to), 1)
        );
        emit Response(success, data);
    }

    
    function testCallDoesNotExist(address payable _addr) public payable {
        (bool success, bytes memory data) = _addr.call{value: msg.value}(
            abi.encodeWithSignature("doesNotExist()")
        );

        emit Response(success, data);
    }
}
