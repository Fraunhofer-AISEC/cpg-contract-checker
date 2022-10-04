pragma solidity ^0.4.16;

import "./SafeMath.sol";
import "./Crowdsale.sol";

contract StagedSale is Crowdsale {
    using SafeMath for uint256;

   
    function StagedSale
    ( 
        uint256 _stage1Duration, 
        uint256 _stage2Duration
    ) public {
        uint256 stage1duration = _stage1Duration.mul(1 minutes);
        uint256 stage2duration = _stage2Duration.mul(1 minutes);
    }
}