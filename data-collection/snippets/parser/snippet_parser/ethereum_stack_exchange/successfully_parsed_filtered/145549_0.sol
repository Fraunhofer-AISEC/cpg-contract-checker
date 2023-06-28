pragma solidity ^0.8.4;

contract hello {
    receive() external payable {}

    function func1() public view returns (address) {
        return msg.sender;
    }
}

contract hello2 {
    function func2(address payable adr) public view returns (address) {
        return hello(adr).func1();
    }
}
