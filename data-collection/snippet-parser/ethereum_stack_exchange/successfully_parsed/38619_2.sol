contract SampleCrowdsale is CappedCrowdsale, RefundableCrowdsale {

    function SampleCrowdsale(uint256 _startTime, uint256 _endTime, uint256 _rate, uint256 _goal, uint256 _cap, address _wallet, MintableToken _token) public
        CappedCrowdsale(_cap)
        FinalizableCrowdsale()
        RefundableCrowdsale(_goal)
        Crowdsale(_startTime, _endTime, _rate, _wallet, _token)
    {
    
    
        require(_goal <= _cap);
    }
}
