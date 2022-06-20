    uint256 constant private dailyMinted = 2000e18;
    uint256 lastMintTime;

    address public _owner;
    
    constructor(
        string memory name,
        string memory symbol,
        uint8 decimals,
        address owner
    ) public {
        _name = name;
        _symbol = symbol;
        _decimals = decimals;

        _owner = owner;
        lastMintTime = block.timestamp;
    }
    
    function mintDaily() public {
        require(_owner == msg.sender, "not permitted");
        
        require(lastMintTime + 86400 >= block.timestamp, "mint already" );
        _mint(msg.sender, dailyMinted);
        lastMintTime = block.timestamp;
    }
