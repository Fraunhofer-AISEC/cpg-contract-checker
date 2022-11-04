contract RefundableCrowdsale is FinalizableCrowdsale {
        ⋮ 
    RefundEscrow private _escrow;
        ⋮ 
    constructor(uint256 goal) public {
        require(goal > 0, "Goal should be greater than zero.");
        _escrow = new RefundEscrow(wallet());
        _goal = goal;
    }
        ⋮ 
    function _forwardFunds() internal {
        _escrow.deposit.value(msg.value)(msg.sender); 
    }
}
