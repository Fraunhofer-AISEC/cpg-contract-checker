contract ContractA {

    function pay () public returns (bool) {

        TokenContract tk = TokenContract("tokenContractAddress");
        tk.transferFrom(msg.sender, address(this), 5);
        tk.approve(address(this), 5);
        tk.transfer("someAccount", 5);

        return true;
    }
}

interface TokenContract {
    function transferFrom(address sender, address recipient, uint256 amount) external returns (bool);
    function approve(address spender, uint256 amount) external returns (bool);
    function transfer(address recipient, uint256 amount) external returns (bool);   
}

contract TokenContract is ERC20, ERC20Detailed {
    constructor() ERC20Detailed("Token", "TKN", 18) public {
        _mint(msg.sender, 1000);
    }
}
