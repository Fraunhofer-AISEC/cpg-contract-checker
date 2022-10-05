pragma solidity ^0.8.3;

contract Receiver {
    event Received(address caller, uint256 amount, string message);
    
    uint256 bar = 9;

    function foo(string memory _message, uint _x) public payable returns (uint256) {
        emit Received(msg.sender, msg.value, _message);
        return _x + 1;
    }
    
    function getVal() public view returns(uint256) {
        return bar;
    }
    
    function setVal(uint256 _bar) public payable returns (uint256) {
        bar = _bar;
        return bar;
    }
    
}

contract Caller {
    event Response(bool success, bytes data);

    
    
    function testCallFoo(address payable _addr, uint256 z) public payable {
        
        (bool success, bytes memory data) = _addr.call{value: msg.value, gas: 5000}(
            abi.encodeWithSignature("foo(string,uint256)", "call foo", z)
        );

        emit Response(success, data);
    }
    
    function testCallBar(address payable _addr, uint256 z) public payable {
        
        (bool success, bytes memory data) = _addr.call{value: msg.value, gas: 5000}(
            abi.encodeWithSignature("setVal(uint256)", z)
        );

        emit Response(success, data);
    }
    
    
}
