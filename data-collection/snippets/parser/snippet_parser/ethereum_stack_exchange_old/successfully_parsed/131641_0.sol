
pragma solidity >=0.4.22 <0.9.0;

contract ContractName {
  struct list {
    string Pan;
    uint256 age;
    address Address;
    bool Enrolled;
    bool voted;
  }
  struct candidate_list {
    string Name;
    address Address;
    uint256 id;
    bool listed;
  }
  address election_officer;
  string public decimal = '0'; 
  uint256 public totalSupply;
  address public founder;
}
