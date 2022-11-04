contract MyToken is ERC20, Pausable, Ownable {
    event MTKBuyEvent (
        address from,
        address to,
        uint256 amount
    );
    
    event MTKSellEvent (
        address from,
        address to,
        uint256 amount
    );

    mapping (address => uint256) pendingWithdrawals;


    constructor(string memory _name, string memory _symbol) ERC20(_name, _symbol) public { 
        _mint(msg.sender, 1000);
    }

    
    function buyToken(uint256 _amount) external payable {
        
        
        require(_amount == ((msg.value / 1 ether)), "Incorrect amount of Eth.");
        transferFrom(owner, msg.sender, _amount);
        emit MTKBuyEvent(owner, msg.sender, _amount);
    }
    
    
    function sellToken(uint256 _amount) public {
        pendingWithdrawals[msg.sender] = _amount;
        transfer(owner, _amount);
        **withdrawETH();**
        emit MTKSellEvent(msg.sender, owner, _amount);
    }
}
