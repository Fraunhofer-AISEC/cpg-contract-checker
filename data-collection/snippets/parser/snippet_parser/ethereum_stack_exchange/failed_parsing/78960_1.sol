Contract Factory {

function Registration( 
string memory _state, 
string memory _district, 
string memory _village, 
uint256 _surveyNumber, 
address payable _OwnerAddress, 
uint _marketValue, uint id) public returns(LandRegistry) { 
require(superAdmin[_village] == _msgSender() || isOwner(),''); 
LandRegistry registry = new LandRegistry(_state, _district, _village, _surveyNumber, _OwnerAddress, _marketValue, id);
_LandRegistry[keccak256(abi.encodePacked(_msgSender()))] = registry; return registry;     } }
