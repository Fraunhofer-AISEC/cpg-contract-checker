pragma solidity 0.8.15;

contract A {
  mapping(address => uint256) public balances;
}

contract B {
    A immutable private _a;

    constructor(A a) {
        _a = a;
    }

    uint256 num = 0;

    struct ReceiveCall {
        address msgSender;
        uint256 msgValue;
        mapping(address => bool) didSomething;
    }

    mapping(uint256 => ReceiveCall) private _receiveCalls;

    receive() external payable {
        ReceiveCall storage thisReceiveCall = _receiveCalls[num++];
        thisReceiveCall.msgSender = msg.sender;
        thisReceiveCall.msgValue = msg.value;
    }

    function doSomething(uint256 receiveCallNum) external {
        require(_a.balances(msg.sender) > 100);
        ReceiveCall storage receiveCall = _receiveCalls[receiveCallNum];
        require(!receiveCall.didSomething[msg.sender]);
        
        receiveCall.didSomething[msg.sender] = true;
    }
}
