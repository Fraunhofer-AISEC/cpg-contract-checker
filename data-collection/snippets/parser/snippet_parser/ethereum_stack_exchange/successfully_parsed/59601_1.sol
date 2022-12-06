pragma solidity ^0.4.24;

contract example {
    address[] public users;
    mapping (address => uint) public count;

    function donate() public payable{
        require(msg.value == .002 ether);
        if (count[msg.sender] == 0) {
            users.push(msg.sender);
        }

        count[msg.sender] += 1;

    }
}
