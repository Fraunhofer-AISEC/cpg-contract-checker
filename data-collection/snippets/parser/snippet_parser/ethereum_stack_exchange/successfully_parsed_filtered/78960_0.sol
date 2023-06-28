contract LandRegistry {

struct landDetails{ 
string state; 
string district; 
string village; 
uint256 surveyNumber; 
address payable CurrentOwner; 
uint marketValue; 
bool isAvailable; 
address requester;        
reqStatus requestStatus;
    }

   landDetails public land;

constructor( 
string memory _state, 
string memory _district, 
string memory _village, 
uint256 _surveyNumber, 
address payable _OwnerAddress, 
uint _marketValue, 
uint id) public {         
land.state = _state;        
land.district = _district;         
land.village = _village;         
land.surveyNumber = _surveyNumber;         
land.CurrentOwner = _OwnerAddress;         
land.marketValue = _marketValue;
profile[_OwnerAddress].assetList.push(id);
} }
