   function invest(uint256 amount) payable external{
        

        recordTransaction(address(this), amount, false);
        recordTransaction(owner, amount, true);

         
        address payable contractAddress = payable(address(this));
        contractAddress.send(amount);
    }
