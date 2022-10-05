pragma solidity ^0.5.0;

import "./ERC721Tradable.sol";
import "openzeppelin-solidity/contracts/ownership/Ownable.sol";

contract Creature is ERC721Tradable {
    constructor(address _proxyRegistryAddress)
        public
        ERC721Tradable("StygianCoins", "STG", _proxyRegistryAddress)
    {}

    function baseTokenURI() public pure returns (string memory) {
        return "https://ipfs.io/ipfs/QmeB87321i121xN88bXZzmjSUXqS46B8bU3H9ocyTb8tJf";
    }

    function contractURI() public pure returns (string memory) {
        return "https://contract-abis.herokuapp.com/api/contract/stygian-coins";
    }
}
