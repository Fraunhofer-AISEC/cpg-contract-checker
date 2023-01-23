
function createCredential(string _credentialLevel, string _credentialTitle, string _credentialDivision, address _credentialOrgAddress) 
public onlyOwner
returns (bool insertStatus)
{
    emit CredentialFactoryActivity(msg.sender, _credentialTitle, "New Credential Add (ATTEMPT)");
    insertStatus = false;
    require(bytes(_credentialLevel).length > 0 && bytes(_credentialLevel).length < 50, "createCredential - Level length problem");
    require(bytes(_credentialTitle).length > 0 && bytes(_credentialTitle).length < 70, "createCredential - Title length problem");
    require(bytes(_credentialDivision).length >= 0 && bytes(_credentialDivision).length < 50, "createCredential - Division length problem");
    uint32 position = uint32(orgAddressToCredentials[_credentialOrgAddress].push(Credential(_credentialOrgAddress, _credentialLevel, _credentialTitle, _credentialDivision, uint32(block.timestamp))));
    if(position > 0){
        insertStatus = true;
        orgAddressToCredentialTotalCount[_credentialOrgAddress] = orgAddressToCredentialTotalCount[_credentialOrgAddress].add(1);
        emit CredentialFactoryActivity(_credentialOrgAddress, _credentialTitle, "New Credential Add (SUCCCESS)");
    } else {
        emit CredentialFactoryActivity(_credentialOrgAddress, _credentialTitle, "New Credential Add (FAILED)");
    }
}
