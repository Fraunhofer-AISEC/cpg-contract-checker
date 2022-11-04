pragma solidity ^0.4.8;
import './RentalContract.sol';


contract contractFactory {
  address[] public contracts;


  function getContractCount() public constant returns(uint) {
    return contracts.length;
  }

  function newContract(uint _rent, uint _security_deposit, string _house, address _owner, address _tenant)
  public constant returns(address) {
    Rental c = new Rental(_rent, _security_deposit, _house, _owner, _tenant);
    contracts.push(c);
    return c;
  }
}
