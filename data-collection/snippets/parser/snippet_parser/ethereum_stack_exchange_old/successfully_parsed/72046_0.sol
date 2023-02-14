pragma solidity >=0.5.0 <0.7.0;
pragma experimental ABIEncoderV2;

contract Manage{

 struct Policy{
  string  PolicyID ;
 }
 mapping (address => mapping(string => Policy)) private policy;

 function storePolicy(address insuranceHolder,string memory _PolicyID) public {        
   policy[insuranceHolder][_PolicyID].PolicyID = _PolicyID;
 }
 function getPolicy(address insuranceHolder,string memory _PolicyID) public view returns(Policy memory) {
  return policy[insuranceHolder][_PolicyID];
 }
}
