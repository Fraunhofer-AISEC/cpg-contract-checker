
pragma solidity ^0.8.1;

import "openzeppelin-contracts/access/Ownable.sol";
import "openzeppelin-contracts/math/SafeMath.sol";


contract Fundraiser is Ownable {
    using SafeMath for uint256;
    string public name;
    uint256 public money;
    constructor( string memory _name,  uint256 _money,address _custodian  )
        public payable{
        name = _name;
        money = _money;
        transferOwnership(_custodian); }

   function pay() public payable {
        uint256 balance = address(this).balance;
        address payable employee = payable(msg.sender);
        employee.transfer(money);

    }
    

}

