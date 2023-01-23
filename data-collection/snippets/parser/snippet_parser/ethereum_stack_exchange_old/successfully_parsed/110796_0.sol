    pragma solidity ^0.6.0;

contract HotelRoom {


address payable public owner;
uint256 public amount ;

    enum Statuses { Vacant, Occupied }
    Statuses currentStatus;
    

    event Occupy(address _occupant, uint _value);

    constructor() public {
        owner = msg.sender;
        currentStatus = Statuses.Vacant;
        
    }
    
    

    modifier onlyWhileVacant {
        require(currentStatus == Statuses.Vacant, "Currently occupied.");
        _;
    }
    
  function setAmount(uint256 _amount) public returns(uint256){
        amount= _amount;
    }
    
    receive() external payable onlyWhileVacant  {
       require (msg.value >= amount, " not enough eth provided");
        currentStatus = Statuses.Occupied;
        owner.transfer(msg.value);
        emit Occupy(msg.sender, msg.value);
    }
}
