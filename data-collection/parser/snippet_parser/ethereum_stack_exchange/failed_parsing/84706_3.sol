    
    function withdrawAmount(uint256 amount) public {
         require(amount <= getBalance());
         msg.sender.transfer(amount);
         emit Transfer(amount);
 
     }
     
     let tx = await contract.withdrawAmount(half_eth, { from: accounts[1] });

