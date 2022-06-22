  function getTransfer(uint _transferId) public view returns(uint,address,uint){
    Details memory _locked = transferDetails[_transferId];
    return(_locked.amount,_locked.owner,_locked.transferId);
  }
