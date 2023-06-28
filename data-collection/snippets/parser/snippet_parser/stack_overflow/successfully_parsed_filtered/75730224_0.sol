function swapGNRtoGRO(uint256 gnrQty) public payable
    {
         require(buyOnGRO,"Buy Stopped.");
         require(!isContract(msg.sender),"Can not be contract");  
         uint256 totalGRO=(gnrQty*1e18)/getGROPrice();  
         groToken.transfer(msg.sender , totalGRO);
         gnrToken.transferFrom(msg.sender, address(this), gnrQty);
         emit TokenDistribution(address(this), msg.sender, gnrToken, groToken, gnrQty, totalGRO);                   
     }


    function swapGROtoGNR(uint256 groQty) public payable
    {
         require(sellOnGRO,"Sell Stopped.");
         require(!isContract(msg.sender),"Can not be contract");    
         require(groQty<=MaximumSell,"Invalid Quantity!");     
         uint256 ded=(groQty*groTognrFee)/100;         
         uint256 restToken = groQty-ded;
         uint256 totalGNR = (restToken*getGROPrice())/1e18;
         gnrToken.transfer(msg.sender,totalGNR);
         groToken.transferFrom(msg.sender,address(this),groQty);
         if(ded>0)
         groToken.transfer(marketingAddress, ded);
         emit TokenDistribution(msg.sender, address(this), groToken,  gnrToken, groQty, totalGNR);                  
     }  
