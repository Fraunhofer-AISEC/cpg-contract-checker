pragma solidity 0.5.1;
import "https://github.com/0xcert/ethereum-erc721/src/contracts/tokens/nf-token.sol";
import "https://github.com/0xcert/ethereum-erc721/src/contracts/ownership/ownable.sol";

contract GameCards is NFToken, Ownable {

    struct Orc {
        uint health;
        uint strenth;
    }

    Orc[] orcs;

    function createOrc(uint health, uint strenth) 
        external
        onlyOwner
        returns(uint256 newOrcId)
    {
        newOrcId = orcs.length;

        orcs.push(Orc({
            health: health,
            strenth: strenth
        }));

        super._mint(msg.sender, newOrcId);
    }

    function getOrcHealth(uint id) external view returns (uint health) {
        health = orcs[id].health;
    }

    function getOrcStrenth(uint id) external view returns (uint strength) {
        strength = orcs[id].strenth;
    }
}
