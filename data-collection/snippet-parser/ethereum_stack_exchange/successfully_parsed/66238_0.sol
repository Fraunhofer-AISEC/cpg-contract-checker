   constructor() public {
           name = "PPT";
           symbol = "PPT";
           initialSupply = 10000000000;
           totalSupply_ = initialSupply * 10 ** uint(decimals);
           balances[owner] = totalSupply_;
           mintCap = 50000000000;
           emit Transfer(address(0), owner, totalSupply_);
       }
