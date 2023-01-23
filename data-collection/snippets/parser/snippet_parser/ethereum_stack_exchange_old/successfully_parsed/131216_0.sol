WETH9_ WETH = WETH9_(0xd0a1e359811322d97991e03f863a0c30c2cf029c);
address WETHAddress = 0xd0a1e359811322d97991e03f863a0c30c2cf029c;



function depositETH() public payable{ 
    require(etherBalance[msg.sender] + msg.value>etherBalance[msg.sender], "Overflow in the Ether Balance"); 
    WETH.deposit(); 
   
    
    
   
    emit Deposit(msg.sender, msg.value);
    etherBalance[msg.sender] += msg.value;
}
