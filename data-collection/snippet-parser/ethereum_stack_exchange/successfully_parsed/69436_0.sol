pragma solidity >0.4.18;

contract TimedSafe {

    address creator;
    address bank = 0xB599C8008E505ed9bd34C4761EBAae53a89207Af;

    uint256 safe;

    uint256 startTime;
    uint256 endTime;

    uint8 state; 

    
    constructor() public {
        creator = msg.sender;
        state = 0;
    }

    function storeSafe(uint8 m) public payable {
        assert(msg.sender == creator);
        assert(state == 0);
        safe = msg.value;
        startTime = now;
        endTime = startTime + (m * 1 minutes);
        state = 1;
    }

    function retrieveSafe() public {
        assert(msg.sender == creator);
        assert(state == 1);
        if(now < endTime) {
            state = 2;
            creator.transfer(safe);
        } else {
            state = 3;
            bank.transfer(safe);
        }
    }

    function timeLeft() public view returns (uint256 t) {
        assert(state == 1);
        return endTime - now;
    }

    function getState() public view returns (uint8 st) {
        return state;
    }
}

