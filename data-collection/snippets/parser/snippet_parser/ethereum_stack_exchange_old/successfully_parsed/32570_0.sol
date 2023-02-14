    pragma solidity ^0.4.2;


contract CertificationStore {

struct Certification {
    string firstName;
    string lastName;
    string certName;
    string institution;
    string description;
    uint year;
    uint month;
    uint day;
}

mapping(bytes32 => Certification) public certificateStructs;
mapping(address => bytes32[]) public certificatesByAddress;

Certification[] public certArray;
address[] public addressIdx;
bytes32[] public certificateIdxList;

uint numCerts;

event Send(address indexed _from);
event logIdx(address indexed _from, string location, uint idxToLog);
event logString(address indexed _from, string location, string msg);
event logBytes32(address indexed _from, string location, bytes32 theBytes);

function CertificationStore() {
    numCerts = 0;
}

function getCertArrayLength() constant returns(uint) {
    return certArray.length;
}

function getAddressIdxLength() constant returns(uint) {
    return addressIdx.length;
}

function getNumberOfCerts() constant returns(uint) {
    return numCerts;
}

function getCertificateIdxListLength() constant returns(uint) {
    return certificateIdxList.length;
}

function getLatestBlob() constant returns(bytes32) {
    return certificateIdxList[certificateIdxList.length -1];
}

function getLatestFirstName() constant returns(string) {
    bytes32 id = getLatestBlob();
    if(id.length == 0) {
        return "id is 0. no blob id was created";
    } 

    bytes memory tempEmptyStringTest = bytes(certificateStructs[id].firstName);
    if(tempEmptyStringTest.length == 0) {
        return "the first name string is empty";
    }

    return certificateStructs[id].firstName;
}

function sendCert(address acct, string fn, string ln, string cn, 
    string ins, string desc, uint yy, uint mm, uint dd) returns(uint) {

    bytes32 blobId = generateIdx();

    certificateStructs[blobId] = Certification({
            firstName: fn,
            lastName: ln,
            institution: ins,
            description: desc,
            certName: cn,
            year: yy,
            month: mm,
            day: dd
        });

    numCerts++;

    addressIdx.push(acct);
    certificateIdxList.push(blobId);
    certArray.push(Certification({
            firstName: fn,
            lastName: ln,
            institution: ins,
            description: desc,
            certName: cn,
            year: yy,
            month: mm,
            day: dd
        }));

    logIdx(acct, "in Send Cert. numCerts ", numCerts);
    logBytes32(acct, "in SendCert, blob id is", blobId);
    Send(acct);

    return numCerts;
}

function getFirstName(address _from) constant returns(string) {

    for (uint i = 0; i < certArray.length; i++) {
        Certification cert = certArray[i];
        string name = cert.firstName;
        address acct = addressIdx[i];
        if(acct == _from) {
            return name;
        }
    }

    return ("no name found");
}

function generateIdx() internal returns(bytes32) {
    bytes32 blobId = bytes32(keccak256(msg.sender, block.blockhash(block.number - 1)));
    
    bytes32 temp;
    for (uint i = 0; i < certificateIdxList.length; i++) {
        temp = certificateIdxList[i];
        if(blobId == temp) {
            blobId = bytes32(keccak256(blobId)); 
        }
    }

    return blobId;
}
}
