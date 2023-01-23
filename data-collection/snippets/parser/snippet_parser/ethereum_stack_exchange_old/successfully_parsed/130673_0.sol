

pragma solidity 0.8.14;

contract RSVP {

    event RSVPd (address guestWhoRSVPd, string message);
    event checkedIn (string message);
    event fundsHaveBeenDispersed (string message);

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
        emit RSVPd(msg.sender, "You have RSVP'd");
    }

    function getBalance() public view onlyHost returns (uint) {
        return address(this).balance;
    }

    function eventStartCheckIn(address payable guest) public onlyHost {
        for (uint i = 0; i < rsvpAddresses.length; i++) {
            if (guest == rsvpAddresses[i])
            (bool sent, ) = guest.call{value: 1 ether}("");
            require(sent, "Failed to send Ether");
            checkedInAddresses.push(guest);
        }
    }

    function checkInOver() public onlyHost {
        status = Status.RSVPCheckInOver;
        emit checkedIn ("The check-in period is over!");
    }

    function disperseRemainingFunds() public onlyHost {
        require(status == Status.RSVPCheckInOver);
        uint arraylength = checkedInAddresses.length;
        uint amountToPay = (address(this).balance / checkedInAddresses.length);
        uint i;
        for(i = 0; i < arraylength -1; i++) {
            payable(checkedInAddresses[i]).transfer(amountToPay); 
        }
        payable(checkedInAddresses[arraylength - 1]).transfer(address(this).balance);
        emit fundsHaveBeenDispersed ("The funds have been dispersed");
    }
    
}
