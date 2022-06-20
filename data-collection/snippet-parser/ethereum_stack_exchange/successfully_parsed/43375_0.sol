pragma solidity ^0.4.8;
import './RentalContract.sol';


contract ContractFactory {
  address[] public contracts;

  function ContractFactory() {
  }
  function getContractCount() public constant returns(unit contractCount) {
    return contracts.length;
  }

  function newContract(unit _rent, unit _security_deposit, string _house, address _owner, address _tenant)
  public returns(address newContract) {
    Rental c = new Rental(_rent, _security_deposit, _house, _owner, _tenant);
    contracts.push(c);
    return c;
  }
}
