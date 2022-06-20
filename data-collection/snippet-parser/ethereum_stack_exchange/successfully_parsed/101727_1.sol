
pragma solidity ^0.5.0;
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/release-v2.5.0/contracts/math/SafeMath.sol";

contract TesterContract {
    using SafeMath for uint256;
    function example() public pure returns(uint256){
        uint256 value1 = SafeMath.div(800, 100);
        uint256 value2 = SafeMath.mul(25, 24);
        uint256 value3 = SafeMath.mul(value1 , value2 );  
        uint256 value4 = SafeMath.sub(8000, 500); 
        return SafeMath.div(value3, value4);
    }
}
