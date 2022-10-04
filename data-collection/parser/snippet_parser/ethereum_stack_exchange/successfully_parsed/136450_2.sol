function transferto(address payable _to, bytes32 trx_hash, uint amount ) external {

    require(balances[trx_hash] == 0, "Unique hash conflict, hash is already in use.");

    balances[trx_hash] = amount;
    deposit_count++;

      
    require(trx_hash != 0, "Transaction hash cannot be empty!");
    
    require(amount != 0, "Escrow amount cannot be equal to 0.");

    
    
    
    
    
    require(balances[trx_hash] != 0, "Escrow with transaction hash doesn't exist.");
    
   
    (bool success, ) = _to.call{value: balances[trx_hash]}("");
        require(success, "Failed to send Ether");

    
    balances[trx_hash] = 0;
  }
