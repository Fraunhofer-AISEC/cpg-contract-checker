
pragma solidity ^0.8.0;

import "../goblin.sol";

contract MarketPlace is GoblinNFT {

    GoblinNFT goblin = GoblinNFT(0xf8e81D47203A594245E36C48e151709F0C19fBe8);

    function sellGoblin(uint goblinId, uint price) public isGoblinOwner(goblinId) {
        require(!goblins[goblinId].selling);
        Goblin storage _goblin = goblins[goblinId];
        _goblin.price = price * 10 ** 18;
        _goblin.selling = true;
    }

    function buyGoblin(uint goblinId) public payable isNotGoblinOwner(goblinId) {
        require(goblins[goblinId].selling, "Not selling");
        Goblin storage _goblin = goblins[goblinId];
        uint _price = _goblin.price;
        address _goblinOwner = goblinToOwner[goblinId];
        require(blueGem.balanceOf(msg.sender) >= _price);
        require(blueGem.transferFrom(msg.sender, _goblinOwner, _price));
        _transfer(_goblinOwner, msg.sender, _goblin.tokenId);
        goblinToOwner[goblinId] = msg.sender;
        _goblin.selling = false;
        _goblin.price = 0;
    }

    modifier isGoblinOwner(uint goblinId) {
        require(goblinToOwner[goblinId] == msg.sender);
        _;
    }

    modifier isNotGoblinOwner(uint goblinId) {
        require(goblinToOwner[goblinId] != msg.sender);
        _;
    }

}
