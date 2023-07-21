
pragma solidity ^0.8.8;

contract LevelUp {

    struct Customers {
        string name;
        uint256 level;
    }
    Customers[] public customers;
    mapping (string => uint256) nameToTicketLevel;

    function addCustomer(string memory _name, uint256 _ticketLevel) public {
        customers.push(Customers(_name, _ticketLevel));
        nameToTicketLevel[_name]=_ticketLevel;
    }

    function levelUp(string memory _name) public {
        for (uint i = 0; i <= customers.length; i++ ){
            if (customers[i].name = _name){
                customers[i].ticketLevel += 1;
            }
        }
    }

}
