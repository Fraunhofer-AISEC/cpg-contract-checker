contract Test 
   {
     
     address owner; 
     ERC20token ec;
     
      constructor () public {
        owner=msg.sender; 
     }

    function Asset_mint(uint _amount) public 
    {
         
         ec._mint(msg.sender, _amount);
         
    }
}
