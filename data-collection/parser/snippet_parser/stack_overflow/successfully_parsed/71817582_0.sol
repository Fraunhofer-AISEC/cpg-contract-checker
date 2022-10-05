struct EventTicket {
    uint256 ticketPrice;
    bool availableForResell;
    address payable seller;
    address payable owner;
}
EventTicket[] eventticket; 
function setForResale(uint256 _id, uint256 _newPrice) 
    external  
{
    transferFrom(msg.sender, address(this), _id);
    eventticket[_id - 1].availableForResell = true;
    eventticket[_id - 1].ticketPrice = _newPrice;
    eventticket[_id - 1].seller = payable(msg.sender);
    eventticket[_id - 1].owner = payable(address(this));
}
function sendMoney(
  uint256 _id
  ) public payable {
    
  address payable seller = eventticket[_id].seller;
  seller.send(msg.value);
}
