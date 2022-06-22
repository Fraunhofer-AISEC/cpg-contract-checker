function resetCounter() public payable returns(bool) {
    if (mapAddress[msg.sender] > 0) {
        mapAddress[msg.sender] = 0;
        return true;
    } else {
        return false;
    }
}
