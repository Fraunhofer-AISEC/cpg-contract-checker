pragma solidity 0.5.10;

import "./Claimable.sol";
import "../openzeppelin-solidity/contracts/token/ERC20/ERC20.sol";
import "../openzeppelin-solidity/contracts/token/ERC20/ERC20Burnable.sol";


contract MyToken is ERC20, ERC20Burnable, Claimable {
    string public name = "Public Name Token";
    string public symbol = "PNT";
    uint8 public decimals = 8;

    
    function mint(address to, uint256 value) public onlyOwner returns (bool) {
        require(value > 0);
        _mint(to, value);
        return true;
    }
}  
