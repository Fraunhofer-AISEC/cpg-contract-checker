

pragma solidity 0.8.14;

contract RSVP {

    address public Host;
    address[] public rsvpAddresses;
    address[] public checkedInAddresses;

    enum Status {RSVPInProgress, RSVPCheckInOver}
    Status public status;

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
        require(msg.value == 1 ether, "You must pay 1 ether to RSVP");
        rsvpAddresses.push(payable(msg.sender));
    }

    function getBalance() public view onlyHost returns (uint) {
        return address(this).balance;
    }

    function eventStartCheckIn(address payable guest) public onlyHost {
        for (uint i = 0; i < rsvpAddresses.length; i++) {
            if (guest == rsvpAddresses[i])
            guest.transfer(1 ether);
            checkedInAddresses.push(guest);
        }
    }

    function checkInOver() public onlyHost {
        status = Status.RSVPCheckInOver;
    }

    function disperseRemainingFunds() public onlyHost {
        require(status == Status.RSVPCheckInOver);
        uint disbursement = (address(this).balance / checkedInAddresses.length);
        
    }

}
