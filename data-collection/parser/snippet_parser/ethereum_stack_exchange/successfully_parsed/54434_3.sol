pragma solidity ^0.5.1;

import "https://github.com/0xcert/ethereum-erc721/src/contracts/tokens/nf-token.sol";

contract CryptofieldBase {
    struct Horse {
        uint256 horseAttributes;
    }

    Horse[] horses;

    function buyStallion(uint256 horseAttributes) internal {
        Horse memory horse;
        horse.horseAttributes = horseAttributes;
        horses.push(horse);
    }
}

contract CToken is CryptofieldBase, NFToken {
    uint256 stallionsAvailable = 168;

    function createStallion(address _sender, uint256 _hash) external payable {
        require(stallionsAvailable > 0);
        stallionsAvailable -= 1;
        uint256 tokenId = horses.length;
        _mint(_sender, tokenId);
        buyStallion(_hash);
    }
}

contract Auctions is CToken {
    
    function __ownerOf(uint256 _horseId) external view returns(address _owner) {
        _owner = idToOwner[_horseId];
        require(_owner != address(0));
    }
}
