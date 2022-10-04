address payable spender = msg.sender;
address owner;
address payable newspender;

owner = address(spender);   
newspender = address( uint160(owner) );    
