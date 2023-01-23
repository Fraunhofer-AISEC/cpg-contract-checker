pragma solidity ^0.5.0;
pragma experimental ABIEncoderV2;

interface IERC20 {
    function totalSupply() external view returns (uint256);
    function balanceOf(address account) external view returns (uint256);
    function transfer(address recipient, uint256 amount) external returns (bool);
    function allowance(address owner, address spender) external view returns (uint256);
    function approve(address spender, uint256 amount) external returns (bool);
    function transferFrom(address sender, address recipient, uint256 amount) external returns (bool);
    event Transfer(address indexed from, address indexed to, uint256 value);
    event Approval(address indexed owner, address indexed spender, uint256 value);
}

contract IOneSplit {
    function getExpectedReturn(
        IERC20 fromToken,
        IERC20 toToken,
        uint256 amount,
        uint256 parts,
        uint256 disableFlags
    )
        public
        view
        returns(
            uint256 returnAmount,
            uint256[] memory distribution
        );
}

contract TradingBot  {

    
    address ONE_SPLIT_ADDRESS = 0xC586BeF4a0992C495Cf22e1aeEE4E446CECDee0E;
    uint256 PARTS = 10;
    uint256 FLAGS = 0;

    
    function () external payable  {}

    function getreturn (address _from, address _to, uint256 _amount) public view returns(uint returnAmount, uint[] memory distribution) {
        IERC20 _fromIERC20 = IERC20(_from);
        IERC20 _toIERC20 = IERC20(_to);
        IOneSplit _oneSplitContract = IOneSplit(ONE_SPLIT_ADDRESS);
        (returnAmount, distribution) = _oneSplitContract.getExpectedReturn(_fromIERC20, _toIERC20, _amount, PARTS, FLAGS);
    } 
}
