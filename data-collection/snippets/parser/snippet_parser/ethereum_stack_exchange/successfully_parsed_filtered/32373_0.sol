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

mapping (address => Certification) public certifications;

Certification[] public certArray;
address[] public addressIdx;

uint numCerts;

event Send(address indexed _from);
event logIdx(address indexed _from, string location, uint idxToLog);
event logString(address indexed _from, string location, string msg);

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

function sendCert(address acct, string fn, string ln, string cn, 
    string ins, string desc, uint yy, uint mm, uint dd) returns(uint) {

    certifications[acct] = Certification({
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
    logString(acct, "in Send Cert", "pushed to both arrays");
    logIdx(acct, "in Send Cert. numCerts ", numCerts);
    Send(acct);

    return numCerts;
}

function getFirstName(address _from) constant returns(string) {

    for (uint i = 0; i < certArray.length; i++) {
        Certification cert = certArray[i];
        string name = cert.firstName;
        logIdx(_from, "at index in getFirstName", i);
        address acct = addressIdx[i];
        if(acct == _from) {
            return name;
        }
    }

    return ("no name found");
}
}
