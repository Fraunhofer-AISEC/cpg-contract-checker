pragma solidity ^0.4.18;

contract DSquare {

    mapping (address => uint[]) public checkins;

    function checkin() public {
        uint[] storage userCheckins = checkins[msg.sender];
        if (userCheckins.length > 0) {
          require(now - userCheckins[userCheckins.length - 1] > 1 minutes);
        }

        userCheckins.push(now);
    }

    function returnCheckinValue(address mapKey, uint arrayRow) public view returns(uint value) {
        return checkins[mapKey][arrayRow];
    }
}
