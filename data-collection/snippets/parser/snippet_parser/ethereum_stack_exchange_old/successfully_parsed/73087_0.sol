pragma solidity ^0.4.24;

contract TestContract {
    event Start(uint start, uint middle, uint end);
    event End(uint start, uint middle, uint end);

    uint one;
    uint public two;
    uint public three;

    function setInitialParams(uint _one, uint _two, uint _three) public {
        emit Start(one, two, three);
        one = _one;
        two = _two;
        three = _three;
        emit End(one, two, three);
    }

    function () public {
        revert();
    }
}
