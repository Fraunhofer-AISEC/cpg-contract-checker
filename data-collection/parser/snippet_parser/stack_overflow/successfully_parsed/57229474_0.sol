pragma solidity ^0.5.0;
pragma experimental ABIEncoderV2;
contract SimpleStorage {

    enum Status { NotExist, Created, InTransit, PaidFor, Completed }

    struct Property {
        Status state;
        uint price;
        address currOwner;
    }

    Property[] public arr; 

    mapping (address => uint) balances; 

    Property public house;

    function registerProperty(uint _price) public {
        house = Property(Status.Created, _price,msg.sender);
        
    }

function get()public returns(Status, uint , address){
    return (house.state, house. price , house.currOwner);
}
}
