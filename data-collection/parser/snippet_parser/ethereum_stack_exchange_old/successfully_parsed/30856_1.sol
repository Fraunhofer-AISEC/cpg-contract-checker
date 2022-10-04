function transferToOwner() payable returns (bool) {
    owner.transfer(msg.value);
    return true;
}
