pragma solidity ^0.4.21;  

  
import "./Pausable.sol";  
import "./SafeMath32.sol";  

contract CredentialOrgFactory is Pausable {


using SafeMath32 for uint32;


mapping(address => CredentialOrg) addressToCredentialOrg;


event CredentialOrgCreateEvent(string shortName, address schoolAddress, string detail);
event CredentialOrgEvent(address schoolAddress, string detail);


uint32 private credentialOrgCount;


struct CredentialOrg {
    string shortName;          
    string officialSchoolName; 
    address schoolAddress;
}

CredentialOrg[] private credentialOrgs; 


constructor() public {
    credentialOrgCount = 0;
}


function getOwner()
public view
returns (address returnedOwner)
{
    returnedOwner = owner;
}


function createCredentialOrg(string _shortName, string _officialSchoolName, address _schoolAddress) 
public 
returns (bool createStatus)
{
    emit CredentialOrgCreateEvent(_shortName, _schoolAddress, "New Org Add (PRE)");
    require(bytes(_shortName).length > 0 && bytes(_shortName).length < 31, "createCredentialOrg shortName problem");
    require(bytes(_officialSchoolName).length > 0 && bytes(_officialSchoolName).length < 70, "createCredentialOrg officalSchoolName length problem");
    require(_schoolAddress != 0, "createCredentialOrg (FAIL) school Address can not be 0");
    createStatus = false;
    uint32 position = uint32(credentialOrgs.push(CredentialOrg(_shortName, _officialSchoolName, _schoolAddress)));
    if (position > 0){
        addressToCredentialOrg[_schoolAddress] = credentialOrgs[position.sub(1)];
        credentialOrgCount = credentialOrgCount.add(1);
        createStatus = true;
        emit CredentialOrgCreateEvent(_shortName, _schoolAddress, "createCredentialOrg (SUCCESS)");
    } else {
        emit CredentialOrgCreateEvent(_shortName, _schoolAddress, "createCredentialOrg (FAIL)");
    }
    return (createStatus);
}


function selectCredentialOrgByPosition(uint32 _credentialOrgPosition) 
public view 
returns (string shortName, string officialSchoolName, address schoolAddress)
{
    shortName = "";
    officialSchoolName = "";
    schoolAddress = 0;
    require(_credentialOrgPosition >= 0, "selectCredentialOrg - position had to be greater or equal to 0.");
    if (_credentialOrgPosition < credentialOrgCount){
        emit CredentialOrgEvent(msg.sender, "selectCredentialOrg~position - (SUCCESS)");
        return (credentialOrgs[_credentialOrgPosition].shortName, credentialOrgs[_credentialOrgPosition].officialSchoolName, credentialOrgs[_credentialOrgPosition].schoolAddress);
    } else {
        emit CredentialOrgEvent(msg.sender, "selectCredentialOrg~position - (FAIL) top boundry exceeded.");
        return (shortName, officialSchoolName, schoolAddress);
    }
}


function selectCredentialOrgByAddress(address _credentialOrgAddress) 
public view 
returns (string shortName, string officialSchoolName, address schoolAddress)
{
    require(_credentialOrgAddress != 0, "selectCredentialOrg - Address 0 not valid");
    CredentialOrg memory testCred = addressToCredentialOrg[_credentialOrgAddress];
    if (testCred.schoolAddress != 0){
        emit CredentialOrgEvent(msg.sender, "selectCredentialOrg~address - (SUCCESS)");
        return (testCred.shortName, testCred.officialSchoolName, testCred.schoolAddress);
    } else {
        emit CredentialOrgEvent(msg.sender, "selectCredentialOrg~address - (FAIL)");
        return ("", "", 0);
    }
}


function isCredentialOrg(address _credentialOrgAddress) 
public view
returns (bool isOrgAddress)
{
    isOrgAddress = false;
    CredentialOrg memory testCredentialOrg = addressToCredentialOrg[_credentialOrgAddress];
    if (testCredentialOrg.schoolAddress != 0){
        isOrgAddress = true;
        emit CredentialOrgEvent(msg.sender, "isCredentialOrg - (SUCCESS)");
    } else {
        emit CredentialOrgEvent(msg.sender, "isCredentialOrg - (FAIL)");
    }
    return (isOrgAddress);
}


function selectOrgCount()
public view
returns (uint32 returnOrgCount)
{
    returnOrgCount = credentialOrgCount;
    emit CredentialOrgEvent(msg.sender, "selectOrgCount - (SUCCESS)");
    return (returnOrgCount);
}

}
