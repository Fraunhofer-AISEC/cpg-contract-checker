

pragma solidity 0.8.14;

contract RSVP {

    address public Host;
    address[] public rsvpAddresses;

    constructor() {
        Host = msg.sender;
    }

    
    error OnlyHost();

    modifier onlyHost() {
        if (msg.sender != Host) {
            revert OnlyHost();
        }
        _;
    }

    function rsvp() public payable {
        require(msg.value == 1 ether);
        rsvpAddresses.push(msg.sender);
    }

    function eventStartCheckIn(address payable guest) public onlyHost {
        for (uint i = 0; i < rsvpAddresses.length; i++) {
            if (guest = rsvpAddresses[i])
            guest.transfer(1 ether);
        }
    }

}
