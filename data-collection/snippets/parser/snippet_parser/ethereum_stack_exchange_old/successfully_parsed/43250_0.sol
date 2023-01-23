pragma solidity ^0.4.18;

contract DSquare {

    mapping (address => uint) public checkins;

    function checkin() public {
        require(now - checkins[msg.sender] > 1 minutes);

        checkins[msg.sender] = now;
    }
}
