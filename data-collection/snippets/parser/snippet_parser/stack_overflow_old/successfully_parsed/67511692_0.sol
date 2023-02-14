pragma solidity ^0.8;

interface IERC20 {
    function transfer(address _to, uint256 _value) external returns (bool);
    
    
}

contract MyContract {
    
    
    function sendUSDT(address _to, uint256 _amount) external {
         
         
         
        IERC20 usdt = IERC20(address(0xdAC17F958D2ee523a2206206994597C13D831ec7));
        
        
        usdt.transfer(_to, _amount);
    }
}
