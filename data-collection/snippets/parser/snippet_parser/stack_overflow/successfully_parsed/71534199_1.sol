
pragma solidity ^0.8.12;
import "@openzeppelin/contracts/token/ERC20/ERC20.sol";



abstract contract Faucet is ERC20 {
    uint256 private _maxMintAmount;

    constructor(uint256 maxMintAmount) {
        _maxMintAmount = maxMintAmount;
    }

    function _drip(address account) internal {
        _mint(account, _maxMintAmount);
    }

    
    function getMaxMintAmount() public view returns (uint256) {
        return _maxMintAmount;
    }
}
