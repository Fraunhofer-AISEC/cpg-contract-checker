pragma solidity 0.4.24;

contract DB {

  address public owner;
  mapping(address => bool) public allowedContracts;

  modifier onlyAllowedContracts() {
      require(allowedContracts[msg.sender]);
      _;
  }

  modifier onlyOwner {
      require(msg.sender == owner);
      _;
  }

  constructor() public {
      owner = msg.sender;
  }

  function isAllowedContract(address check) public view returns(bool isIndeed) {
      return allowedContracts[check];
  }

  function addAllowedContract(address newContract) public onlyOwner returns(bool success) {
      require(!isAllowedContract(newContract));
      allowedContracts[newContract] = true;
      return true;
  }

  function removeAllowedContract(address newContract) public returns(bool success) {
      require(isAllowedContract(msg.sender));
      allowedContracts[newContract] = false;
      return true;
  }

  function insertNewDataRecords() public onlyAllowedContracts returns(bool success) {
      
      return true;
  }
}
