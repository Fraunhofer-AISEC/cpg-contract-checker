

pragma solidity ^0.8.0;

contract HotelRoom {
    enum Statuses {
        Vacant,
        Occupied
    }
    Statuses currentStatus;

    event Occupy(address _occupant, uint256 _value);

    address payable public owner;
    address public occupant;

    constructor() {
        owner = payable(msg.sender);
        currentStatus = Statuses.Vacant;
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "You are not the owner.");
        _;
    }

    modifier onlyWhileVacant() {
        require(currentStatus == Statuses.Vacant, "Currently Occupied.");
        _;
    }

    modifier costs(uint256 _amount) {
        require(msg.value >= _amount, "Not enough Ether provided");
        _;
    }

    receive() external payable onlyWhileVacant costs(2 ether) {
        
        
        currentStatus = Statuses.Occupied;
        owner.transfer(msg.value - 1 ether);
        occupant = msg.sender;
        emit Occupy(msg.sender, msg.value);
    }

    modifier isOccupant() {
        require(msg.sender == occupant, "You are not the current occupant.");
        _;
    }

    event CheckOut(address _occupant);
    event Evict(address _occupant);

    function checkOut() external isOccupant {
        occupant = address(0);
        currentStatus = Statuses.Vacant;
        payable(msg.sender).transfer(1 ether); 
        emit CheckOut(msg.sender);
    }

    function evict() external onlyOwner {
        occupant = address(0);
        currentStatus = Statuses.Vacant;
        owner.transfer(1 ether); 
        emit Evict(msg.sender);
    }
}
