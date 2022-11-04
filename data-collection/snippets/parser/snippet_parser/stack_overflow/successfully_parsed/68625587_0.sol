 function doFlip() public{
       uint256 blockValue = uint256(blockhash(block.number - 1));
       uint256 coinFlip = uint256(uint256(blockValue)/FACTOR);
       side = coinFlip == 1 ? true : false;
       flipper.flip(side);
    }
