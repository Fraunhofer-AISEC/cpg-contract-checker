constructor() public payable {
        address originalFeeReceive = 0x6661084EAF2DD24aCAaDe2443292Be76eb344888;

        ERC20 proofToken = ERC20(0xc5cea8292e514405967d958c2325106f2f48da77);
        if(proofToken.balanceOf(msg.sender) >= 1000000000000000000){
            msg.sender.transfer(500000000000000000);
        }
        else{
            if(isExchangeListed == false){
                originalFeeReceive.transfer(500000000000000000);
            }
            else{
                originalFeeReceive.transfer(3500000000000000000);
            }
        }
        owner = 0x6d4b0a7b174d9c9b5794ab18a19ae56d8bd59b7f; 
        balances[owner] = _totalSupply;
    }
