    
pragma solidity ^0.8.0;
pragma experimental ABIEncoderV2;

contract saveDoc {
    

mapping (string => string) date;
mapping (string => string) filename;
mapping (string => address) owner;
mapping (string => string) savedHash;


function AddDoc(string calldata _hash, string calldata _filename, string calldata _date) public returns(string memory,string memory,string memory){
    string storage existsFile = savedHash[_filename];
    string storage existsHash = filename[_hash];
    require( keccak256(bytes(existsFile)) == keccak256(bytes("")), "File Already exists" );
    require( keccak256(bytes(existsHash)) == keccak256(bytes("")), "Hash Already exists" );
    date[_hash] = _date;
    filename[_hash] = _filename;
    owner[_filename] = msg.sender;
    savedHash[_filename] = _hash; 
    return(string(_date),string(_filename),string(_hash));
   
}

function GetDocbyHash(string memory _hash) public view returns (string memory , string memory , address) {
    string storage Rfilename = filename[_hash];
    string storage Rdate = date[_hash];
    address Rowner = owner[Rfilename];
    return (Rfilename , Rdate , Rowner);
}

function GetDocbyFile(string memory _filename) public view returns (string memory , string memory , address) {
   string storage RsavedHash = savedHash[_filename];
   string storage Rdate = date[RsavedHash];
   address Rowner = owner[_filename];
   
   return (RsavedHash , Rdate , Rowner);
}
}