contract WidgetMaker is Owned {
  
}

contract WidgetManager is Owner {
  
  function changeWidgetMakerOwner(address newOwner) public onlyOwner returns(bool success) {
    require(newOwner != 0); 
    maker.changeOwner(newOwner); 
    LogMakerOwnerChanged(msg.sender, newOwner);
    return true;

}
}