struct shelf
{
  mapping(address => uint256) shelves;      
}
mapping (address => shelves) bookcase;
bookcase[msg.sender] = shelf();

bookcase[msg.sender].shelves[shelf_address] = 1;
