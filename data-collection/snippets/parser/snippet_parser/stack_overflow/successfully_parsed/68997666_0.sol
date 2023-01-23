  
  function mintBatch(address _recipient, uint256[] calldata _ids,
    uint256[] calldata _amounts, bytes calldata _data)
    external virtual {
    require(_recipient != address(0),
      "ERC1155: mint to the zero address");
    require(_ids.length == _amounts.length,
      "ERC1155: ids and amounts length mismatch");

    
    address operator = _msgSender();
    _beforeTokenTransfer(operator, address(0), _recipient, _ids, _amounts,
      _data);

    
    
    for (uint256 i = 0; i < _ids.length; i++) {
      require(_hasItemRight(_ids[i], MINT),
        "Super1155: you do not have the right to mint that item");

      
      uint256 shiftedGroupId = (_ids[i] & GROUP_MASK);
      uint256 groupId = shiftedGroupId >> 128;
      uint256 mintedItemId = _mintChecker(_ids[i], _amounts[i]);

      
      balances[mintedItemId][_recipient] = balances[mintedItemId][_recipient]
        .add(_amounts[i]);
      groupBalances[groupId][_recipient] = groupBalances[groupId][_recipient]
        .add(_amounts[i]);
      totalBalances[_recipient] = totalBalances[_recipient].add(_amounts[i]);
      mintCount[mintedItemId] = mintCount[mintedItemId].add(_amounts[i]);
      circulatingSupply[mintedItemId] = circulatingSupply[mintedItemId]
        .add(_amounts[i]);
      itemGroups[groupId].mintCount = itemGroups[groupId].mintCount
        .add(_amounts[i]);
      itemGroups[groupId].circulatingSupply =
        itemGroups[groupId].circulatingSupply.add(_amounts[i]);
    }

    
    emit TransferBatch(operator, address(0), _recipient, _ids, _amounts);
    _doSafeBatchTransferAcceptanceCheck(operator, address(0), _recipient, _ids,
      _amounts, _data);
  }
