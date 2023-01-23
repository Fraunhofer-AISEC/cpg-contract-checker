function transfer(address payable _to, uint _amount) public {
    (bool success, ) = _to.call{value: _amount}("");
    require(success, "Failed to send Ether");
}
