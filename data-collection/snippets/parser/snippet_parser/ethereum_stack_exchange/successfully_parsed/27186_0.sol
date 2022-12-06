pragma solidity ^0.4.0;
contract SignatureStatus
{
    string documentIDhash;
    struct Signature {
        string documentID; 
        string studyID; 
        string timeStamp; 
        bool consented; 
    }



function consentBuild(documentIDhash,studyIDhash,timeStamphash,consentedhash) public returns (Signature)
{
string documentID = documentIDhash;
string studyID = studyIDhash;
string timeStamp = timeStamphash;
bool consented = consentedhash;


 }
    
    function Status() returns (bool status) 
    {
    
    if (consented == true) {status = true;} else {status = false;}
    }
}