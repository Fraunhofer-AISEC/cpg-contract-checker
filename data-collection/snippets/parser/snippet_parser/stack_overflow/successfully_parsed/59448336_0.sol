pragma solidity >=0.4.21 <0.6.0;

contract Test {

    struct Ticket {
       uint seatNumber;
    }

    mapping (string => Ticket) myMapping;

    function isExists(string memory key) public view returns (bool) {

        if(myMapping[key].seatNumber != 0){
            return true;
        } 
        return false;
    }

    function add(string memory key, uint seatNumber) public returns (bool){            
        myMapping[key].seatNumber = seatNumber;            
        return true;
    }
}
