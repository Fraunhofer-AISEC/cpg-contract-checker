

modifier onlyBy(address _credentialOrgAddress){
    uint32 foundAccount = 0;
    CredentialOrgFactory cof = CredentialOrgFactory(credentialOrgContractAddress);
    if (cof.isCredentialOrg(_credentialOrgAddress)){
        foundAccount = 1;
    }
    require(foundAccount == 1, "Not Credentialing Org");
    _;
}
