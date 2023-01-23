function letsdo(uint first, uint last) public {
    entry[msg.sender] = UserInfo(first, last);
}
