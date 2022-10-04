pragma solidity >=0.6.0 <0.7.0;
 struct Info {
    address creator;
    bytes16 id;
    
    
    string detail;
    bytes32[8]  hash ;
}
uint16 public infoSize = 0;
mapping(bytes16 => Info) public infos;
bytes16[] public infosId;
function newInfo(string memory detail  )
    public
    returns (
        bytes16 
    )
{
    
    bytes16 infoId = randomId();
    
    Info storage i = infos[infoId];
    i.detail = detail;
    i.id = infoId;
    i.creator = msg.sender;
    i.hash= [ "0x9ba99edb","0x9ba99edb","0x9ba99edb","0x9ba99edb","0x9ba99edb","0x9ba99edb","0x9ba99edb","0x9ba99edb"];
    infosId.push(infoId);
     infoSize=infoSize+1;
    return infoId;
}
