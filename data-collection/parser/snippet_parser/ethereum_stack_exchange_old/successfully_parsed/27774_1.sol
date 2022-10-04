contract Oracle {  
    IAddressManager private addressManager;

    function Oracle(
        address _addressManager,
        bytes _eventName, 
        bytes32[] _eventResultNames, 
        uint256 _eventBettingEndBlock,
        uint256 _decisionEndBlock,
        uint8 _averageBlockTime,
        uint256 _arbitrationOptionMinutes) 
        public
        payable
    {
        require(_addressManager != address(0));
        require(msg.value >= minBaseReward);
        require(_eventName.length > 0);
        require(_eventResultNames.length > 1);
        require(_decisionEndBlock > _eventBettingEndBlock);
        require(_averageBlockTime > 0);
        require(_arbitrationOptionMinutes > 0);

        addressManager = IAddressManager(_addressManager);
        eventName = _eventName;

        for (uint i = 0; i < _eventResultNames.length; i++) {
            eventResults.push(Result({
                name: _eventResultNames[i],
                votedBalance: 0
            }));
        }

        eventBettingEndBlock = _eventBettingEndBlock;
        decisionEndBlock = _decisionEndBlock;

        uint256 arbitrationBlocks = getArbitrationOptionBlocks(_averageBlockTime, _arbitrationOptionMinutes);
        arbitrationOptionEndBlock = decisionEndBlock.add(arbitrationBlocks);
        assert(arbitrationOptionEndBlock > decisionEndBlock);

        OracleCreated(_eventName, _eventResultNames, _eventBettingEndBlock, _decisionEndBlock, 
            arbitrationOptionEndBlock, msg.value);
    }
}
