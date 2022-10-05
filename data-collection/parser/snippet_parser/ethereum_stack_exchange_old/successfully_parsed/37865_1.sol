interface token {
    function transfer(address receiver, uint amount) public;

    
    function balanceOf(address) public returns (uint256);
}
