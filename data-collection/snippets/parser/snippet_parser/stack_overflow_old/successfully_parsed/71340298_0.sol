
pragma solidity 0.8.11;

import "@openzeppelin/contracts/token/ERC1155/extensions/ERC1155Supply.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract NFTTest is ERC1155Supply, Ownable {
    uint256 public price = 0.005 ether;
    string public name = "NFT TEST";

    constructor() ERC1155("https://do.main") {}

    function setName(string memory _name) public onlyOwner 
    {
        name = _name;
    }

    function getName() public view returns (string memory) 
    {
       return name;
    }

    function mint(uint256 amount) external payable {
        require(msg.value >= price, "Not enough cash");
        _mint(msg.sender, amount, 1, "");
    } 
}```
