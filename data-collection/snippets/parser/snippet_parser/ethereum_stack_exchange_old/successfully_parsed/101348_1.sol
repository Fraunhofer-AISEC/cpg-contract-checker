pragma solidity ^0.5.0;
pragma experimental ABIEncoderV2;

interface IERC20 {

    function totalSupply() external view returns (uint256);
    function balanceOf(address account) external view returns (uint256);
    function allowance(address owner, address spender) external view returns (uint256);

    function transfer(address recipient, uint256 amount) external returns (bool);
    function approve(address spender, uint256 amount) external returns (bool);
    function transferFrom(address sender, address recipient, uint256 amount) external returns (bool);


    event Transfer(address indexed from, address indexed to, uint256 value);
    event Approval(address indexed owner, address indexed spender, uint256 value);
}

contract ctr {
    
    address payable OWNER;
    
    address ZRX_STAKING_PROXY = 0xa26e80e7Dea86279c6d778D702Cc413E6CFfA777; 
    
    address  WETH = 0xC02aaA39b223FE8D0A0e5C4F27eAD9083C756Cc2;
    address  SAI = 0x89d24A6b4CcB1B6fAA2625fE562bDD9a23260359;
    address  DAI = 0x6B175474E89094C44Da98b954EedeAC495271d0F;

   constructor() public payable {
        _getWeth(msg.value);
        _approveWeth(msg.value);
        OWNER = msg.sender;
    }
     function _getWeth(uint256 _amount) internal {
        (bool success, ) = WETH.call.value(_amount)("");
        require(success, "failed to get weth");
    }

    function _approveWeth(uint256 _amount) internal {
        IERC20(WETH).approve(ZRX_STAKING_PROXY, _amount);
    }
    
}
