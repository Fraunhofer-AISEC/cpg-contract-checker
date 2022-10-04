struct Agreement {
    bytes32 id;                                                 
    address owner;                                             
    string fileHash;                                           
    address[] signers;                                         
    uint256 timestamp;                                          
    uint256[] types;
    mapping(uint256 => mapping(address => Stamp)) stamps;    
}

struct Stamp { 
    address signer;
    uint256 blockNumber;
    uint256 timestamp;
}

function createAgreement(
    bytes32 _id, 
    address _owner,  
    string memory _fileHash,
    address[] memory _listOfSigners,
    uint256[] memory _types
)   public returns (bool success) {

    agreements[_id].id = _id;
    agreements[_id].owner = _owner;
    agreements[_id].fileHash = _fileHash;
    agreements[_id].timestamp = block.timestamp;
    agreements[_id].signers = _listOfSigners;
    agreements[_id].types = _types;

    return true;
}
