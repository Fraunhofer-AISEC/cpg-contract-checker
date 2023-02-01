
pragma solidity ^0.8.0;

import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/token/ERC20/ERC20.sol";

contract lock {
    ERC20 _token;

    constructor(address _tokenAddress) { 
        _token = ERC20(_tokenAddress);
    }

    
    function getName() external view returns(string memory) {
        return _token.name();
    }
}
