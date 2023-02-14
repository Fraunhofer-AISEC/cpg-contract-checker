contract Token is ERC20 {
constructor() public ERC20('DonkeyCoin', 'DKC'){
    _mint(msg.sender, uint(100 * 10 ** uint(decimals())));
}

function Approve(uint amount) public {
    ERC20.approve(msg.sender, amount);
}
}