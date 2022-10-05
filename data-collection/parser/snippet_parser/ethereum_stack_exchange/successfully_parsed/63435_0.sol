    string public name = "Token ZIZ";
    string public symbol = "ZIZ";
    uint8 public decimals = 18;
    uint256 public totalSupply = 1000000 * 10 ** uint256(decimals);

    
    uint256 public TokenPerETHBuy = 10000;  

    
    uint256 public TokenPerETHSell = 10000;

    

    function buy() payable public returns (uint amount){
          require(msg.value > 0);

          amount = ((msg.value.mul(TokenPerETHBuy))).div(1 ether);

          balanceOf[this] -= amount;                        
          balanceOf[msg.sender] += amount; 
          emit BuyToken(msg.sender,msg.value,amount);
          return amount;
    }

    

    function sell(uint amount) public returns (uint revenue){

        require(balanceOf[msg.sender] >= amount);         
        balanceOf[this] += amount;                        
        balanceOf[msg.sender] -= amount;                  

        revenue = (amount).div(TokenPerETHSell) ;

        msg.sender.transfer(revenue);                     
        emit Transfer(msg.sender, this, amount);               
        return revenue;                                   

    }
