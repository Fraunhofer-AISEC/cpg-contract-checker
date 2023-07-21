
pragma solidity >=0.6.2 <0.9.0;

contract TestPayable {
    uint x;
    uint y;

    fallback() external payable {
        x = 1;
        y = msg.value;
    }

    receive() external payable {
        x = 2;
        y = msg.value;
    }
}

contract Caller {
    function callTestPayable3(TestPayable test) public returns (bool) {
        (bool success, ) = address(test).call{value: 2 ether}("");
        require(success, "low-level call failed");
        return true;
    }

    receive() external payable {}
}
