pragma solidity ^0.8.0;

import "./MyCoin.sol";

contract MyCoinSupply is MyCoin("MyCoin", "MYC") 
{
    constructor() public 
    {
        _mint(msg.sender, 1000);
    }

    function getCoinbase() public returns (address) 
    {
        return block.coinbase;
    }

    function _mintMinerReward() internal 
    {
        
    }

    function _transfer(address from, address to, uint256 value) override internal
    {
        _mintMinerReward();
        super._transfer(from, to, value);
    }
}
