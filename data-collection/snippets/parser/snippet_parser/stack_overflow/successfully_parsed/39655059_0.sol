contract KYCCHECK{

function KYCCHECK(){} 
struct User{ 
    uint id; 
    bool isVerified;
    string fname;
    string mname;
    string lname;
    string genderValue;
    string maritalStat;
    string stat;
    string identity;
} 
mapping(uint => User) kyclist; 

function setKYCData(uint uid,string firstname,string middlename,string lastname,string gvalue,string maritalVal,string statusVal,string identityVal) { 
    kyclist[uid].fname = firstname;
    kyclist[uid].mname = middlename;
    kyclist[uid].lname = lastname;
    kyclist[uid].genderValue = gvalue;
    kyclist[uid].maritalStat = maritalVal;
    kyclist[uid].stat = statusVal;
    kyclist[uid].identity = identityVal;
}

function getFirstName(uint uid) constant returns (string retFNameVal) {
    retFNameVal = kyclist[uid].fname;
    return retFNameVal;
}
function getMiddleName(uint uid) constant returns (string retMNameVal) {
    retMNameVal = kyclist[uid].mname;
    return retMNameVal;
}
function getLastName(uint uid) constant returns (string retLNameVal) {
    retLNameVal = kyclist[uid].lname;
    return retLNameVal;
}
function getGender(uint uid) constant returns(string retGenderVal) {
    retGenderVal = kyclist[uid].genderValue;
    return retGenderVal;
}
function getMaritalStatus(uint uid) constant returns(string retMaritalVal){
    retMaritalVal= kyclist[uid].maritalStat;
    return retMaritalVal;
}
function getStatus(uint uid) constant returns(string retStatus){
    retStatus = kyclist[uid].stat;
    return retStatus;
}
function getIdentity(uint uid)constant returns(string retIdentity){
    retIdentity = kyclist[uid].identity;
    return retIdentity;
}   
}