contract ActivityInterface{
    address CongressAddress = 0x1;
    Congress temp = Congress(CongressAddress);
    mapping (address => uint) stakeholderId = temp.stakeholderId;
}
