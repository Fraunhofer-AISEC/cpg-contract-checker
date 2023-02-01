
pragma solidity ^0.8.2;

import "@openzeppelin/contracts/token/ERC1155/ERC1155.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/utils/Strings.sol";

contract MyContract is ERC1155, Ownable {
    string public name;
    string public symbol;
    uint256 public mintPrice;
    uint256 public totalSupply;
    uint256 public maxSupply;
    address public withdrawWallet;

    constructor(string memory _name, string memory _symbol) payable ERC1155("https://ipfs.io/ipfs/QmQq3kLMG8fkikYqjrBST2inxTk9sYpcAn274e14sdfgj/") {
        name = _name;
        symbol = _symbol;
        mintPrice = 0.002 ether;
        totalSupply = 0;
        maxSupply = 10000;
        withdrawWallet = msg.sender;
    }

    function mintOwner(uint256 _amount) public onlyOwner {
        require(totalSupply + _amount <= maxSupply, 'Sold out');
        _mint(msg.sender, 0, _amount, "");
        totalSupply = totalSupply + _amount;
    }

    function mint(uint256 _amount) public payable {
        require(msg.value == _amount * mintPrice, 'wrong mint value');
        require(totalSupply + _amount <= maxSupply, 'Sold out');
        _mint(msg.sender, 0, _amount, "");
        totalSupply = totalSupply + _amount;
    }
    
    function setURI(string memory newuri) public onlyOwner {
        _setURI(newuri);
    }

    function withdraw() external onlyOwner {
        (bool success,) = withdrawWallet.call{value : address(this).balance}('');
        require(success, 'withdraw failed');
    }
}
