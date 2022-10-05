pragma solidity ^0.4.18;

contract MetaCoin {
    function getBlockNumber()
    public
    view
    returns (uint)
    {
        return block.number;
    }
}
