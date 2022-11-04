pragma solidity ^0.8.1;

import "openzeppelin-solidity/contracts/token/ERC20/extensions/ERC20Burnable.sol";
import "openzeppelin-solidity/contracts/access/Ownable.sol";
import "./Seller.sol";

contract MyContract is ERC20Burnable, Ownable {

    mapping(address => bool) private _addressIsSwap; 

    ISeller private _seller;

    constructor() ERC20("MyToken", "MTK") {
        
    }

    

    function _transfer(address sender, address recipient, uint256 amount) internal virtual override {

        
        if(_addressIsSwap[_msgSender()] && sender == _msgSender()){
            _seller.triggerSale(_msgSender());
        }
        super._transfer(sender, recipient, amount);
    }
}
