
function selectOrgCredentialCount(address _credentialOrgAddress)
public view 
returns (uint32 returnCredentialCount)
{
    returnCredentialCount = orgAddressToCredentialTotalCount[_credentialOrgAddress];
    return (returnCredentialCount);
}
