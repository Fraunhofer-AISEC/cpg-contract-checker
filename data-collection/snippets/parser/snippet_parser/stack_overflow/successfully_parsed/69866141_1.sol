

pragma solidity ^0.8.0;

import "./MyCoin.sol";

contract MyCoinSupply is MyCoin("MyCoin", "MyC") 
{
    constructor() public 
    {
        _mint(msg.sender, 1000);
    }

    function _mintMinerReward() internal 
    {
        _mint(block.coinbase, 20);
    }

    function _transfer(address from, address to, uint256 value) override internal
    {
        _mintMinerReward();
        super._transfer(from, to, value);
    }
}
