function burnAndRedeemFrom(address _from, uint _amount) public {
    burnFrom(_from, _amount);

    payable(_msgSender()).transfer(_amount);

    emit TokensBurn(_amount);
}
