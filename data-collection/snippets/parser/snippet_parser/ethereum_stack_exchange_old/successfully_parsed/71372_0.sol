pragma solidity 0.4.24;


contract organA {


struct organ { address originOwner; address currentOwner; string organType; string organState; }


function addOrgan(address _originOwner, string _type, string _state) external returns(bytes32 organHash);
function changeOrganState(bytes32 _organId, string _state) public;
function getOrganListLength() public view returns(uint ListLenght);
function getOrganList(uint indexNumber) public view returns(bytes32 OrganId);
function getOrgan(bytes32 _organHash) public view returns(address OriginOwner, address CurrentOwner, string OrganType, string OrganState);
function existsOrgan(bytes32 _organHash) external view returns(bool Existence);
function organOriginOwner(bytes32 _organHash) external view returns(address OriginOwner);
}
