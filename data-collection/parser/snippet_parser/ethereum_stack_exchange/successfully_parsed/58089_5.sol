pragma solidity ^0.4.22;
import "./Base.sol";
contract Extend{
    Base public base;
    uint public es;
    constructor (address  _baseAdd) public {
        base = Base(_baseAdd);
    }
    function mint() public {
     es =   base.Mint();
    }
    function getES() public view returns(uint){
       return es;   
   }

}
