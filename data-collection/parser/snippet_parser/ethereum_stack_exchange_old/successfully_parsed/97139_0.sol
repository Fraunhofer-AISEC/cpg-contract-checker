

pragma solidity >=0.4.23 <0.9.0;

import "https://github.com/ConsenSysMesh/openzeppelin-solidity/blob/master/contracts/math/SafeMath.sol";

contract StakingToken is ERC20, Ownable{
    using SafeMath for uint256;
    
    constructor(){}
    
    function addNumber(uint256 number) public view returns(uint256) {
        return number.add(5);
    }
}
