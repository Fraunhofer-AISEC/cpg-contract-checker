function showOrg(address org) external view returns(uint identifier, string memory organization_name, bool ActivityStatus, string memory Classifier, string memory Address, string memory DomiciledIn, bool Status){
    require(orgs[org].admins[msg.sender] == true, "You are not authorized to view this data!");
    return(orgs[org].identifier, orgs[org].organization_name, orgs[org].ActivityStatus, orgs[org].Classifier, orgs[org].Address, orgs[org].DomiciledIn, orgs[org].Status);
}
