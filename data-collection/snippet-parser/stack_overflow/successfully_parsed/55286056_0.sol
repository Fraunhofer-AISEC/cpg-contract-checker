pragma solidity^0.5.0;
pragma experimental ABIEncoderV2;

contract I2Chain {

     event FileChained(string checksum, 
     address indexed user, 
     uint timestamp,
     uint fileSize, 
     uint fileTimestamp, 
     string fileType, 
     string fileName);

    event FileShared(string checksum, 
    address indexed user,  
    address indexed recipient,
    uint attributes, 
    uint tenure, 
    uint timestamp);

event FileRead(string checksum, address indexed user, uint timestamp);

event FileDeleted(string checksum, 
address indexed user,
uint timestamp);

event PubKeyUpdate(address indexed user, string pubKey);

mapping(address => string) public publicKeys;

function PublishFile(string memory _checksum,
uint _fileSize,
uint _fileTimestamp, 
string memory _fileType,
string memory _fileName) 
public {

 emit FileChained(_checksum, msg.sender, now, 
 _fileSize,_fileTimestamp, _fileType, _fileName);
}

function ShareFile(string memory _checksum, address _recipient, 
uint _attributes, 
uint _tenure) public {

emit FileShared(_checksum, msg.sender, _recipient, _attributes, 
_tenure, now);
}

function ReadFile(string memory _checksum) public {
    emit FileRead(_checksum, msg.sender, now);
}

function DeleteFile(string memory _checksum) public {
    emit FileDeleted(_checksum, msg.sender, now);
}

function setPublicKey(string memory _pubKey) public {
    publicKeys[msg.sender] = _pubKey;
    emit PubKeyUpdate(msg.sender, _pubKey);
}

function getPublicKey(address _user) 
view public returns(string memory)  {

return publicKeys[_user];
  }
}
