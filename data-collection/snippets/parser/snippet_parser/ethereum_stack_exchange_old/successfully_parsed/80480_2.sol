
contract ExternalStorage{

    
    address[] public Registry;
    mapping(address => profiles) profile;
    bioData public biodataDetails;
    landDetails public land;


    
    struct profiles{
        uint[] assetList;
        }


    
    struct bioData{
        address OwnerAddr;
        string FamilyName;
        string FamilyRep
    }

    
    struct landDetails{
        address OwnerAddr;
        address regAddr;
        bytes32 ReferenceCode;
        bytes32 Longitude;
        bytes32 Latitude
    }

 }
