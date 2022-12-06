contract B {
    ERC20 token;
    uint256 public constant ticketPrice = 10 ** 18; 
    function processPayment(uint amount) public return bool {
        
        if (amount >= ticketPrice) {
            
            require(token.transferFrom(msg.sender, address(this), ticketPrice), "Transfer failed");
            
            emit TicketSold(msg.sender, ticketPrice);
            return true;
        } else {
            
            return false;
        }
    }
}
