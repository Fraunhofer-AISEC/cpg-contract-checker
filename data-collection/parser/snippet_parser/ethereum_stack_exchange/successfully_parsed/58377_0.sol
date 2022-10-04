pragma solidity ^0.4.0;
contract Test {
uint[] timestamp;

function setTime(uint _timeToset) public returns(bool) {
    timestamp.push(now + _timeToset);
   return true;
}

function deleteEntriesBasedOnTime() public returns(bool) {
    for (uint i=0; i<timestamp.length;i++) {
        if (now == timestamp[i]) {
            delete timestamp[i];
            return true;
        }
    }
    return false;
}
}
