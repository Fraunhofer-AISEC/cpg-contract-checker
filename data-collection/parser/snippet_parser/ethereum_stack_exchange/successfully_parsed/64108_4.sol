address payable spender = msg.sender;
address owner;
address payable newspender;

owner = address(spender);   
newspender = payable(owner);    
