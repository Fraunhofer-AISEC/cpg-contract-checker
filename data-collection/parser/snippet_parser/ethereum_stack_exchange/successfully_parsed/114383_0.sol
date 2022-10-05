 function destroySmartContract(address payable _to) public {
    require(msg.sender == owner, "You are not the owner");
    selfdestruct(_to);
}
