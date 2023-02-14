pragma solidity ^0.5.0;

import "https://github.com/OpenZeppelin/openzeppelin-solidity/contracts/token/ERC20/IERC20.sol";

contract MyContract {
    
    address usdtContractAddress = "0xdAC17F958D2ee523a2206206994597C13D831ec7";
    
    function transferUSDT(address _to, uint256 _value) public {
        
        IERC20(usdtContractAddress).transfer(_to, _value).call();
    }
}

