function multipleTransferPreSigned
  (
    bytes[] _signature,
    address[] _to,
    uint[] _value,
    uint[] _fee,
    uint256 _nonce
  )
    public
    returns (bool)
  {
      for(uint256 i=0; i < _signature.length; i++)
      {
        require(_to[i] != address(0));
        require(interfaceData.getSignatures(_signature[i]) == false);
   

        bytes32 hashedTx = transferPreSignedHashing(address(this), _to[i], 
          _value[i], _fee[i], _nonce + i);

        address from = recover(hashedTx, _signature[i]);
   
        require(from != address(0));

        balances[from] = balances[from].sub(_value[i]).sub(_fee[i]);
        balances[_to[i]] = balances[_to[i]].add(_value[i]);
        balances[msg.sender] = balances[msg.sender].add(_fee[i]);
    
        interfaceData.setSignatures(_signature[i], true);
        signatures[_signature] = true;

        emit Transfer(from, _to[i], _value[i]);
        emit Transfer(from, msg.sender, _fee[i]);
        emit TransferPreSigned(from, _to[i], msg.sender, _value[i], _fee[i]);
      }
        return true;
    }
