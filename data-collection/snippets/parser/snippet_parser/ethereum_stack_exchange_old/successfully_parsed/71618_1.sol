pragma solidity ^0.5.1;

contract Signed1 {
    uint val = 0;
    mapping (address => bool) transferred;

    function withdrawOnce(int amount) public returns (uint) {
        require(amount > 0, 'only postive amount');
        require(transferred[msg.sender] == false, 'withdraw only once');
        transferred[msg.sender] = true;
        msg.sender.transfer(uint(amount));
    }

}
