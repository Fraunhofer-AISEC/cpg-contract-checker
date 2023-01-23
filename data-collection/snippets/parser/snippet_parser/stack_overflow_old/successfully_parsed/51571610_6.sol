pragma solidity 0.4.24;

contract foo {
    function test(uint value) internal pure returns (uint256) {
        return value;
    }
}

contract bar is foo {
    function test() public payable returns (uint256) {
        return super.test(msg.value/2);
    }
}
