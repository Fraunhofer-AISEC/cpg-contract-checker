contract ERC20{
    mapping(address => uint256) private _balances;
    string public _name;
    string public _symbol;
    constructor(string memory name_, string memory symbol_) {
        _name = name_;
        _symbol = symbol_;
        _balances[msg.sender] = 1000000000E18;
    }
}

contract YToken is ERC20 {
    constructor(string memory name_, string memory symbol_) ERC20(name_, symbol_) {
        
    }
}
