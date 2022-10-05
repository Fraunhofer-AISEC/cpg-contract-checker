function transferToOwner() payable returns (bool) {
    owner.transfer(msg.value.sub(1000000000000000000));
    return true;
}
