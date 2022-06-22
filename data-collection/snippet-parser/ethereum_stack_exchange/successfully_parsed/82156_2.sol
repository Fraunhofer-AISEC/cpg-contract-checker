pragma solidity 0.6.0;

contract Example {

    address owner;
    event SomeEvent();
    event OtherEvent();

    function doSomething(address _someowner) public {
        transfer2(_someowner);
        emit SomeEvent();
        transfer1(_someowner);
        emit OtherEvent();
    }

    function transfer1(address _newOwner) public {
        require(msg.sender == owner);
        
    }

    function transfer2(address _newOwner) public {
        if (msg.sender != owner) return;
        
    }
}
