pragma solidity ^0.8.2;

import "@openzeppelin/contracts@4.3.2/token/ERC1155/ERC1155.sol";
import "@openzeppelin/contracts@4.3.2/access/Ownable.sol";
import "@openzeppelin/contracts@4.3.2/utils/Strings.sol";

contract MyToken is ERC1155, Ownable {
    constructor() ERC1155("") {}
    string private _uri;
    uint256 private _indexID = 1000000000;
    
    function mint()
        public
        payable
    {
        require(msg.value > 0.001 ether);
        _mint(msg.sender, _indexID, 1, "");
        _indexID++;
    }
    
    ...
}

