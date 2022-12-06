pragma solidity ^0.5.8;


 contract remainNew{

    address public owner = msg.sender;
    uint public cubeCount = 0;

    modifier onlyBy(address _account){
    require(
        msg.sender == _account,
        "Sender not authorized"
    );
    _;
}

struct aCube{
    uint cubeID;
    string owner;
    string ipfsHash;
    string fileName;
    string fileSize;
    string description;
    bool isEncrypted;
    string time;
}

mapping(uint => aCube) public cubes;


function generateCube(string memory _o,string memory _h, string memory _n, string memory _s,
 string memory _d, bool  _i, string memory _t) public {
    cubeCount++;
    cubes[cubeCount] = aCube(cubeCount,_o,_h,_n,_s,_d,_i,_t);
   }

function setHash(string memory _newHash, uint _ID) public onlyBy(owner){
    cubes[_ID].ipfsHash = _newHash;
  }

}
