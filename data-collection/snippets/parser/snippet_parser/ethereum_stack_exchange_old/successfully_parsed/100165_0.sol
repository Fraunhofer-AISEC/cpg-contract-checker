contract Test is ERC20{

address public OWNER;
uint private _totalSupply = 500000;

constructor() ERC20("Test Token ERC20", "T20"){
    
    OWNER = msg.sender;
    _mint(OWNER, _totalSupply);

}

}
