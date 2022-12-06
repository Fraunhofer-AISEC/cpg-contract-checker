

pragma solidity >=0.7.0 <0.9.0;

contract ConcertTicketReservation {

    struct reservation {
        address Id;
        string name;
        string seat;
        Class choice;
    }

    uint256 reservationsCount = 0;
    mapping (uint => reservation) public reservations; 
    
    enum Class{VIP, NON_VIP } 

    Class choice = Class.NON_VIP;

    function setVIP() public { 
        choice = Class.VIP;
    }
    function setNON_VIP() public {
        choice = Class.NON_VIP;
    }

    function getChoice() public view returns (string memory) {  
        if(choice == Class.NON_VIP) {
            return "NON_VIP";
        } else if(choice == Class.VIP) {
            return "VIP";
        }
        return "NON_VIP";
    }

    uint non_vip_price = 0.005 ether; 
    uint vip_price = 0.01 ether;

    event Received(address, uint);

    function pay() internal { 
        uint moneyToReturn;
        if(reservations[reservationsCount].choice == Class.NON_VIP) {
            require (msg.value >= non_vip_price);
            emit Received(msg.sender, msg.value);
            moneyToReturn = msg.value - non_vip_price; 
        } else if(reservations[reservationsCount].choice == Class.VIP) {
            require (msg.value >= vip_price);
            emit Received(msg.sender, msg.value);
            moneyToReturn = msg.value - vip_price; 
        }
        if(moneyToReturn > 0) 
                payable(msg.sender).transfer(moneyToReturn);
    }
     
    
    function makeReservation (string memory _name, string memory _seat) public  payable{
        reservationsCount += 1;
        reservations[reservationsCount] = reservation(msg.sender, _name, _seat, choice);
        pay();
    }

    
    address owner = 0x5B38Da6a701c568545dCfcB03FcB875f56beddC4;

    modifier Owner {
        require(msg.sender == owner, "not eligible");
            _;
    }
}
