function  remainingToken() public view ownable returns (uint remainingSupply)  {

        return (balances[address(this)]);
    }

    

    function presenTime () public view returns ( uint){
        return block.timestamp;
    }  
   
    
    
    function totalSupply() public override view returns (uint) {
        return maximumSupply ;
    }
     
    
    
    function totalContribution() public ownable view returns(uint){
        return address(this).balance;
    }

    

    function balanceOf(address tokenOwner) public override view returns (uint balance) {
        return balances[tokenOwner];
    }

    

    function allowance(address tokenOwner, address spender) public override view returns (uint remaining) {
        return allowed[tokenOwner][spender];
    }
