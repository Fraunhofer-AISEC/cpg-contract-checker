function withdraw() onlyRole(managerRole) nonReentrant public returns(bool) {
    (bool sent, ) = payable(msg.sender).call{value: getBalance()}("");
    require(sent, "Ether not sent: transaction failed");
    emit balanceWithdrawn(msg.sender, address(this).balance);
    return true;
}
