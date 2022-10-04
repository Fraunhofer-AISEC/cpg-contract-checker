pragma solidity ^0.8.0;
import './Splitter.sol';

contract Factory {
  address[] public contracts;

  function getContractCount() public view returns(uint) {
    return contracts.length;
  }

  function registerContract(address payable[] memory _payee, uint256[] memory _share) public returns(Splitter) {
    Splitter c = new Splitter(false, _payee, _share);
    contracts.push(address(c));
    return c;
  }
}
