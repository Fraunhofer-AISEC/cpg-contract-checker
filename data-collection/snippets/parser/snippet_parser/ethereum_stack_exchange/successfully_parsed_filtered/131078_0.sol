

pragma solidity ^0.8.4;

import "@openzeppelin/contracts/token/ERC1155/ERC1155.sol";
import "@openzeppelin/contracts/token/ERC1155/extensions/ERC1155URIStorage.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/token/ERC1155/extensions/ERC1155Supply.sol";

contract MyToken is ERC1155, ERC1155URIStorage, Ownable, ERC1155Supply {
constructor() ERC1155("") {}

function mint(address account, uint256 id, uint256 amount, bytes memory data)
    public
    onlyOwner
{
    _mint(account, id, amount, data);
}

function mintBatch(address to, uint256[] memory ids, uint256[] memory amounts, bytes memory data)
    public
    onlyOwner
{
    _mintBatch(to, ids, amounts, data);
}



function _beforeTokenTransfer(address operator, address from, address to, uint256[] memory ids, uint256[] memory amounts, bytes memory data)
    internal
    override(ERC1155, ERC1155Supply)
{
    super._beforeTokenTransfer(operator, from, to, ids, amounts, data);
}
}
