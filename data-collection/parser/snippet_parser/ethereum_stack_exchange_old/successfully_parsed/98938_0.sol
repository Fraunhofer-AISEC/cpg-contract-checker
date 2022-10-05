  contract MyToken is ERC20{
    uint holders;
    constructor(string memory name, string memory symbol) ERC20 (name, symbol){
        holders = 0;
    } 
    
    function transfer(address recipient, uint256 amount) public override returns (bool) {    
    
        _transfer(_msgSender(), recipient, amount);
        if(balanceOf(recipient) - amount == 0) holders++;
        if(balanceOf(_msgSender()) == 0) holders--;
        
        return true;
    
    }
 }

