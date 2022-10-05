pragma solidity ^0.4.25;

contract Foo {
    mapping (address => function (uint, uint) internal pure returns (uint)) k;

    event New(uint val);

    function gold(uint a, uint b) internal pure returns (uint) {
        return a + b * 10;
    }

    function silver(uint a, uint b) internal pure returns (uint) {
        return a + b * 5;
    }

    function eval(
        function (uint, uint) internal pure returns (uint) f,
        uint a,
        uint b) internal pure returns (uint)
    {
        return f(a, b);
    }

    function register() public payable {
        k[msg.sender] = msg.value > 31415 ? gold : silver;
    }

    function magic(uint a, uint b) public {
        uint val = eval(k[msg.sender], a, b);
        emit New(val);
    }
}
