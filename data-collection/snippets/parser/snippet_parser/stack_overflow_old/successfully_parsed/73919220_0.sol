
pragma solidity ^0.8.0;

import { SafeMath } from "@openzeppelin/contracts/utils/math/SafeMath.sol";

contract Example {

    using SafeMath for uint;
    uint256 public _remainAmount; 
    uint256 public _amount; 
    uint256 public price = 5*10**18;  
    function example(uint256 _tokenAmount) external {
        _remainAmount = _tokenAmount.sub(_tokenAmount.div(100));
        _amount = _remainAmount.div(price).mul(10**18);

    } 

}
