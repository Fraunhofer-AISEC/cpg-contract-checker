contract Faucet {
    uint256 constant public tokenAmount = 100000000000000000000;
    uint256 constant public waitTime = 30 minutes;

    ERC20 public tokenInstance = ERC20(<add_token_address_here>);
    
    mapping(address => uint256) lastAccessTime;

    constructor() public {
      
    }
    ....
