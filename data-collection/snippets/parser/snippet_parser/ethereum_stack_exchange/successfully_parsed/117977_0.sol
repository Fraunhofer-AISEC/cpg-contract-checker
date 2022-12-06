contract TestContract{
    uint256 immutable DEPOSIT_LIMIT_PER_BLOCK = 1 ether;                            

    struct UserDeposit {
        uint256 balance;
        uint256 blockDeposited;
    }
    mapping(address => UserDeposit) public allDeposits;

    constructor() public {}

    receive() external payable {
        require(msg.value <= DEPOSIT_LIMIT_PER_BLOCK, "TOO_MUCH_ETH");

        UserDeposit storage last= allDeposits[tx.origin];

        uint256 maxDeposit = last.blockDeposited == block.number
            ? DEPOSIT_LIMIT_PER_BLOCK - last.balance
            : DEPOSIT_LIMIT_PER_BLOCK;

        if(msg.value > maxDeposit) {
            
            uint256 refundValue = msg.value - maxDeposit ;                        
            
            (bool success,) = msg.sender.call{value: refundValue}("");
            require(success, "ETH_TRANSFER_FAIL");
            
            last.balance -= refundValue;                                             
        }

        last.balance += msg.value;
        last.blockDeposited = block.number;
    }

    function withdraw(uint256 val) external {
        UserDeposit storage last= allDeposits[tx.origin];
        require(last.balance >= val, "NOT_ENOUGH_ETH");

        last.balance -= val;
        
        (bool success,) = msg.sender.call{value: val}("");
        require(success, "ETH_TRANSFER_FAIL");
    }
}
