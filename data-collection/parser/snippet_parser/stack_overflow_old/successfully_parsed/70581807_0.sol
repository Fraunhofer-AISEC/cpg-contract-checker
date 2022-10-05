
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/access/Ownable.sol";
import "./ERC721Tradable.sol";

contract NFTContractFactory is Ownable
{
    event ContractCreated(address addr);

    function createContract(string memory name, string memory symbol)
        public onlyOwner
    {
        Creature nc = new Creature(name, symbol, owner());
        nc.transferOwnership(msg.sender);
        emit ContractCreated(address(nc));
    }
}

contract Creature is ERC721Tradable {
    constructor(string memory _name, string memory _symbol, address _proxyRegistryAddress)
        ERC721Tradable(_name, _symbol, _proxyRegistryAddress)
    {}

    function baseTokenURI() override public pure returns (string memory) {
        return "https://creatures-api.opensea.io/api/creature/";
    }

    function contractURI() public pure returns (string memory) {
        return "https://creatures-api.opensea.io/contract/opensea-creatures";
    }
}
