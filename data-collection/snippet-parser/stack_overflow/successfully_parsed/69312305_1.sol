contract RewardToken is ERC20 {
    constructor() public ERC20("Reward Token","RWD"){
        
        _mint(msg.sender,1000000000000000000000000);
    }
}