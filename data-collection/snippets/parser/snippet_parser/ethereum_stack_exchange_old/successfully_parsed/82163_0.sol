pragma solidity  >=0.4.0 <0.6.0;

contract Example {

mapping(uint => string) documents;


function storeDocument(uint id, string docHash)  public
{
    documents[id] = docHash;
}

function verifyDocument(uint id, string hashToVerify) view public returns (bool)
 {
    if(keccak256(abi.encodePacked(documents[id])) == keccak256(abi.encodePacked(hashToVerify )) )
    {
        return true;
    }
    else
    {
        return false;
    }
 }
}
