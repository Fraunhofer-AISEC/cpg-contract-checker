function transfer(address addr, uint amount) external {
    require(amount <= address(this).balance); 
    (bool s, ) = addr.call{ value: amount }("");
    require(s);
}
