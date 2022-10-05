contract A {
  ERC20 token; 
  B seller;    

  event TicketPurchased(uint);

  function buyTicket(uint amount) public {

    
    token.approve(address(seller), amount);

    
    uint ticketId = seller.buyTicket(amount);

    
    emit TicketPurchased(ticketId);
  }
}

contract B {
  address wallet;   
  ERC20 token;      

  function buyTicket(uint amount) public returns (uint) {

    
    
    token.transferFrom(msg.sender, wallet, amount);

    return 1;   
  }
}
