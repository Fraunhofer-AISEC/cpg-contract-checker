...

abstract contract IOneSplit { 
    function getExpectedReturn (
        IERC20 fromToken,
        IERC20 toToken,
        uint256 amount,
        uint256 parts,
        uint256 disableFlags
    )
        public
        virtual
        view
        returns(
            uint256 returnAmount,
            uint256[] memory distribution
        );

    function swap(
        IERC20 fromToken,
        IERC20 toToken,
        uint256 amount,
        uint256 minReturn,
        uint256[] memory distribution,
        uint256 disableFlags
    ) public virtual payable;
}

...

contract MyContract is ICallee {

    
    address ONE_SPLIT_ADDRESS = 0xC586BeF4a0992C495Cf22e1aeEE4E446CECDee0E;
    uint256 PARTS = 10;
    uint256 FLAGS = 0;
    
    ...
    
    
    function _trade(address _fromTokenAddress, address _toTokenAddress, uint256 _amount, uint8 _slippage_from, uint8 slippage_to) internal {
       
        
        _oneSplitSwap(_fromTokenAddress, _toTokenAddress, returnAmount_1, returnAmount_calc, distribution_1);

    }

    
    function _oneSplitSwap(address _from, address _to, uint256 _amount, uint256 _minReturn, uint256[] memory _distribution) internal {
        
        IERC20 _fromIERC20 = IERC20(_from);
        IERC20 _toIERC20 = IERC20(_to);
        IOneSplit _oneSplitContract = IOneSplit(ONE_SPLIT_ADDRESS);

        
        _fromIERC20.approve(ONE_SPLIT_ADDRESS, _amount);

        
        
        
        _oneSplitContract.swap(_fromIERC20, _toIERC20, _amount, _minReturn, _distribution, FLAGS);

        
        _fromIERC20.approve(ONE_SPLIT_ADDRESS, 0);
    }
    
}
