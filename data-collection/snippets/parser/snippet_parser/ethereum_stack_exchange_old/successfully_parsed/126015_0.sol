
pragma solidity 0.8.7;

import "./Connector.sol";
import "./Base.sol";

contract Test is Connector {

    constructor() Base("gameitem", "itm") {}
  
    function mint(uint tokenId) public {
        _mint(msg.sender,tokenId);
    }
}


abstract contract  Connector is Base {

function _beforeTokenTransfer(
        address from,
        address to,
        uint256 tokenId
    ) internal virtual override {
       
      super._beforeTokenTransfer(from, to, tokenId);     
    }
}


 contract Base {
   
    string private _name;
    string private _symbol;

    constructor(string memory name_, string memory symbol_) {
        _name = name_;
        _symbol = symbol_;
    }

    function _mint(address to, uint256 tokenId) internal virtual {
       
        _beforeTokenTransfer(address(0), to, tokenId);    
    }

    function _beforeTokenTransfer(
        address from,
        address to,
        uint256 tokenId
    ) internal virtual {
   
    }
}




