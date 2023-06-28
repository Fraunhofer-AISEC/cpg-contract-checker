pragma solidity ^0.8.0;

import "@openzeppelin/contracts/access/Ownable.sol";
import "./ERC721Tradable.sol";

contract NFTContractFactory is Ownable
{
    event ContractCreated(address addr);

    function createContract(string memory name, string memory symbol, address proxyRegistryAddress)
        public onlyOwner
    {
        NFTContract nc = new NFTContract(name, symbol, proxyRegistryAddress);
        nc.transferOwnership(msg.sender);
        emit ContractCreated(address(nc));
    }
}

contract NFTContract is ERC721Tradable {
    constructor(string memory _name, string memory _symbol, address _proxyRegistryAddress)
        ERC721Tradable(_name, _symbol, _proxyRegistryAddress)
    {}

    
}
