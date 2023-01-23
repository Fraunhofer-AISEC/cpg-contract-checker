function MyToken() public {
        balances[msg.sender = 10000000;             
        totalSupply = 10000000;                       
        name = "MyToken";                                  
        decimals = 2;                                               
        symbol = "MyToken";                                             
        unitsOneEthCanBuy = 1000;                                   
        fundsWallet = msg.sender;                                   
    }

   function() public payable{
        totalEthInWei = totalEthInWei + msg.value;
        uint256 amount = msg.value * unitsOneEthCanBuy;
        if (balances[fundsWallet] < amount) {
            return;
        }

        balances[fundsWallet] = balances[fundsWallet] - amount;
        balances[msg.sender] = balances[msg.sender] + amount;

        Transfer(fundsWallet, msg.sender, amount); 

        
        fundsWallet.transfer(msg.value);
    }
