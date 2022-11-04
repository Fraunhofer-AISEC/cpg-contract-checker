
pragma solidity >=0.4.23 <0.9.0;

import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/utils/math/SafeMath.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/token/ERC20/ERC20.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/access/Ownable.sol";

contract StakingToken is ERC20, Ownable{
    using SafeMath for uint256;
    
    constructor()ERC20("MyCoin", "XMC"){}
    
    function addNumber(uint256 number) public pure returns(uint256) {
        return number.add(5);
    }
}
