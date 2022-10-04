function deleteAccount() public {
    require(accDetails[msg.sender].creationTimeStamp != 0, "You do not have an account.");
    if(balanceOf[msg.sender] > 0) {
        uint256 _amount = balanceOf[msg.sender];
        balanceOf[msg.sender] = 0;
        payable(msg.sender).transfer(_amount);

        emit withdrawalComplete(msg.sender, accDetails[msg.sender].accNickName, _amount, balanceOf[msg.sender].add(_amount), balanceOf[msg.sender]);
    }
    uint256 _oldUniqueIdentifier = addrTouniqueIdentifier[msg.sender];

    accDetails[msg.sender] = AccDetails("", 0);
    uniqueIdentifierToAddr[addrTouniqueIdentifier[msg.sender]] = address(0);
    addrTouniqueIdentifier[msg.sender] = 0;

    emit accountDeleted(msg.sender, _oldUniqueIdentifier, block.timestamp);
}
