
pragma solidity ^0.8.17;

import "@openzeppelin/contracts/token/ERC1155/ERC1155.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/token/ERC1155/extensions/ERC1155Supply.sol";

contract MintNFT_ERC1155 is ERC1155, Ownable, ERC1155Supply {
    uint256 public mintRate = 0.0001 ether;

    constructor() ERC1155("") {}


    function mint(
        address account,
        uint256 id,
        uint256 amount,
        string memory uri
    ) public payable {
        require(address(this).balance >= mintRate * amount, "not enough ether sent");
        _mint(account, id, amount, "");
        _setURI(uri);
    }

    function mintBatch(
        address to,
        uint256[] memory ids,
        uint256[] memory amounts
    ) public payable {
        _mintBatch(to, ids, amounts, "");
    }

    

    function _beforeTokenTransfer(
        address operator,
        address from,
        address to,
        uint256[] memory ids,
        uint256[] memory amounts,
        bytes memory data
    ) internal override(ERC1155, ERC1155Supply) {
        super._beforeTokenTransfer(operator, from, to, ids, amounts, data);
    }
}
