

pragma solidity ^0.6.6;

import "./AdvancedCollectible.sol";

contract AdvancedCollectibleFactory {

    AdvancedCollectible[] public collectibles;

    function addCollection(

        string memory collectionName,

        string memory symbol,

        string memory tokenUri

    ) public {

        AdvancedCollectible collectible = new AdvancedCollectible(

            collectionName,

            symbol

        );

        collectible.createCollectible(tokenUri);

    }

}
