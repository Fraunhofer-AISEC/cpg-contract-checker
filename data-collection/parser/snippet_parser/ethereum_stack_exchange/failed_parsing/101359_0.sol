}



contract ERC20Interface {
    function totalSupply() public constant returns (uint);
    function balanceOf(address CoinOwner) public constant returns (uint balance);
    function allowance(address CoinOwner, address spender) public constant returns (uint remaining);
    function transfer(address to, uint Coins) public returns (bool success);
    function approve(address spender, uint Coins) public returns (bool success);
    function transferFrom(address from, address to, uint Coins) public returns (bool success);
    event Transfer(address indexed from, address indexed to, uint Coins);
    event Approval(address indexed CoinOwner, address indexed spender, uint Coins);
}
