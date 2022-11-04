import "./ExternalStorage.sol";
import "./Registry.sol";

contract RegistryLogic is ExternalStorage{

    mapping (bytes32 => Registry) private _Registry;
    mapping (bytes32 => Details) private _Detail;
    mapping(address => properties) property;
    struct properties{
        Registry[] assets;
        }

function bioDataReg(
        address _OwnerAddr,
        string memory _FamilyName,
        string memory _FamilyRep
    ) 
    returns(address, Registry)
    {
        Registry _bioRegistry = new Registry(
            _OwnerAddr,
            _FamilyName,
            _FamilyRep);
        property[_OwnerAddr].assets.push(_bioRegistry);
            return (_OwnerAddr, _bioRegistry);
    }


function Registration(
        address _OwnerAddr,
        address _regAddr,
        Registry _bioRegistry,
        bytes32 _ReferenceCode,
        bytes32 _Longitude,
        bytes32 _Latitude) public
        returns(bool) {
        Registry bioreg = property[_OwnerAddr].assets[0];
        Registry registry = bioreg.SaveLandDetail(_OwnerAddr,_regAddr,_ReferenceCode,_Longitude, _Latitude)

