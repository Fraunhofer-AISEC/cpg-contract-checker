
 
pragma solidity >=0.4.21 <0.6.0;


import "../node_modules/@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "../node_modules/@openzeppelin/contracts/math/SafeMath.sol";











contract Ownable {
  address payable public owner;

  event OwnershipTransferred(address indexed previousOwner, address indexed newOwner);

  
  constructor (Ownable) public {
    owner  = msg.sender;
  }


  modifier onlyOwner() {
    require(msg.sender == owner);
    _;
  }


  
  function transferOwnership(address payable newOwner) public onlyOwner {
    require(newOwner != address(0));
    emit OwnershipTransferred(owner, newOwner);
    owner = newOwner;
  }

}



 contract Sample is Ownable  {

event NewResource (uint resourceId, string name , uint quality);

uint qualityUnits = 16;
uint qualityModulo = qualityUnits;
uint cooldownTime = 1 days;




struct Resource {
    string name;
    uint quality;
    uint32 rarity;
    uint256 cooldownTime;
    uint16 stockGain;
    uint16 stockLoss;
    uint32 readyTime;
    uint256 extractionTime;
    uint256 extractionId;
    uint256 magnetiteId;
    uint256 hematiteId;
    uint256 class;
    uint256 sediments;
    uint qualityUnits;

    }




    mapping (uint => address) public resourceToOwner;
    mapping (address => uint) ownerResourceGain;
    Resource[] public resources;



function _createResource (string memory _name , uint _quality) internal {
    uint id = resources.push(Resource(_name,_quality ,1 , uint256( now + cooldownTime), 0 , 0, 0, 
    0, 0, 0, 0, 0, 0, 16) )+1;
    resourceToOwner[id] = msg.sender;
    ownerResourceGain[msg.sender]++;
    emit NewResource(id, _name , _quality);
    }

    
    function _generateRandomQuality(string memory _str ) private view returns (uint) {
        uint rand = uint(keccak256(abi.encode(_str)));
        return rand % qualityModulo;
    }

    

    function createResourceStack(string memory _name) public {
    require(ownerResourceGain[msg.sender] ==0);
    uint randomQuality = _generateRandomQuality(_name);
    randomQuality = randomQuality - randomQuality % 100;
    _createResource(_name, randomQuality);





    }


}




contract CoreRefined is Sample {


    

    function getResourcesStats(uint256 _id)
        external
        view
        returns (
        bool isRefiningInProcess,
        bool isReady,
        uint256 cooldownTime,
        
        uint256 extractionTime,
        uint256 extractionId,
        uint256 magnetiteId,
        uint256 hematiteId,
        uint256 class,
        uint256 sediments
    ) 


    {

        Resource storage stats = resources[_id];
        isRefiningInProcess = (stats.quality != 0);
        isReady = (stats.cooldownTime <= block.number);
        cooldownTime = uint256(stats.cooldownTime);
        extractionTime = uint256(stats.extractionTime);
        extractionId = uint256(stats.extractionId);
        magnetiteId = uint256(stats.magnetiteId);
        hematiteId = uint256(stats.hematiteId);
        class = uint256(stats.class);
        sediments = stats.sediments;
    }

}






contract RefiningInterface is Sample {
    function refining(uint256 _id) external view returns (
        bool isRefiningInProcess,
        bool isReady,
        uint256 cooldownTime,
        uint256 nextActionsAt,
        uint256 extractionTime,
        uint256 extractionId,
        uint256 magnetiteId,
        uint256 hematiteId,
        uint256 class,
        uint256 sediments
    );
}
contract ResourceRefined is Sample , CoreRefined {
    ResourceRefined CoreRefinedContract;

    modifier onlyOwnerOf(uint _resourceId) {
        require(msg.sender == resourceToOwner[_resourceId]);
        _;
    }



    function SetAnotherContractAddress (address _address) external onlyOwner {
        CoreRefinedContract
 = ResourceRefined(_address);
    }

    function triggerCooldown (Resource storage _resource ) internal {
        _resource.readyTime = uint32(now+cooldownTime);

    }

    function _isReady ( Resource storage _resource ) internal view returns (bool) {
    return (_resource.readyTime <= now);
    }


        function refinedAndMultiply( uint _resourceId, uint _targetQuality, string memory _types) internal onlyOwnerOf(_resourceId) {
        Resource storage myResource = resources[_resourceId];
        require(_isReady(myResource));
        _targetQuality % qualityModulo;
        uint newQuality = (myResource.quality + _targetQuality) / 2;
        if(keccak256(abi.encode((_types))) == keccak256(abi.encode("Resources"))) {
            newQuality = newQuality - newQuality % 100 + 99;
    }
    _createResource("NoName", newQuality);
    triggerCooldown(myResource);
    }


    function refineOnInterface(uint256 _resourceId, uint256 _idResources ) public {
    uint256 materialUsed;
    (,,,,,,,,materialUsed) = CoreRefinedContract.getResourcesStats(_idResources);
    refinedAndMultiply(_resourceId,materialUsed,"Resources");


    }





}







contract  ResourceHelper is ResourceRefined {
    
uint rarityForFee = 0.001 ether;

    
    modifier aboveCostLevel (uint _rarity ,uint _resourceId){
        require(resources[_resourceId].rarity >= _rarity);
        _;
    }


    
    

    
    function setRarityFee(uint _fee) external onlyOwner {
        rarityForFee = _fee;
    }

    
    

    function rarityUp(uint _resourceId) external payable {
        require(msg.value == rarityForFee);
        resources[_resourceId].rarity++;
        }

        

    function changeName(uint _resourceId, string calldata   _Newname) external aboveCostLevel(2, _resourceId) onlyOwnerOf (_resourceId){
        resources[_resourceId].name = _Newname;

    }

    
    function changeQualityUnits(uint _resourceId, uint _newQualityUnits) external aboveCostLevel(2, _resourceId) onlyOwnerOf (_resourceId) {
                resources[_resourceId].qualityUnits = _newQualityUnits;

    }

    

    function getTheResourceToOwner( address _owner) external view returns (uint[] memory) {
        uint[] memory result = new uint[](ownerResourceGain[_owner]);
        uint counter = 0;

        
        for (uint i = 0; i < resources.length; i++) {
            if (resourceToOwner[i] == _owner){
                result[counter] = i;
                counter++;
            }


        }
        return result;

    }
}


contract ResourceUp is ResourceHelper {
uint randNonce = 0;
uint resourceUpProba = 70;




function setUp(uint _resourceId, uint _targetId) external onlyOwnerOf(_resourceId) {
    Resource storage myResource = resources[_resourceId];
    Resource storage anotherResource = resources[_targetId];
    uint rand = 100;
    if (rand <= resourceUpProba) {
    myResource.stockGain++;
    myResource.rarity++;
    anotherResource.stockLoss++;
    refinedAndMultiply(_resourceId, anotherResource.quality, "resource");
    } else {
    myResource.stockLoss++;
    anotherResource.stockGain++;
    triggerCooldown(myResource);
        }
    }
}



contract Harvest is  ResourceUp, ERC721 {

    using SafeMath for uint256;

mapping (uint => address) resourceApproval;

    function balanceOf(address _owner) public view returns (uint256 _balance) {
    return ownerResourceGain[_owner];
    }

    function ownerOf(uint256 _tokenId) public view returns (address _owner) {
        return resourceToOwner[_tokenId];
    }

    function _transfer(address _from, address _to, uint256 _tokenId) private {
        ownerResourceGain[_to] = ownerResourceGain[_to].add(1);
        ownerResourceGain[msg.sender] = ownerResourceGain[msg.sender].sub(1);
        resourceToOwner[_tokenId] = _to;
        _transfer(_from, _to, _tokenId);
    }

    function transferTo(address _to, uint256 _tokenId) public onlyOwnerOf(_tokenId) {
        transferTo(_to, _tokenId);

    }

    function approve(address _to, uint256 _tokenId) public onlyOwnerOf(_tokenId) {
        resourceApproval[_tokenId] = _to;
        emit Approval(msg.sender, _to, _tokenId);
    }

    function harvest(uint256 _tokenId) public {
        require(resourceApproval[_tokenId] == msg.sender);
        address owner = ownerOf(_tokenId);
        _transfer(owner, msg.sender, _tokenId);
    }



}

