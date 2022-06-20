pragma solidity ^0.4.18;

contract ContractsRegistry {

  address owner;

  struct ContractInfo {
    bytes32 subject;
    bytes32 companyName;
    string contactName;
    string contactEmail;
    string contactPhone;
  }

  mapping(address => ContractInfo) contractsMap;
  address[]   addresses;
}