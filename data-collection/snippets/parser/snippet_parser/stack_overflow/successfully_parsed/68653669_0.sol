    function showOrg(address org) external view returns(uint international_securities_identifier, string memory organization_name, bool hasActivityStatus, string memory businessClassifier, string memory RegisteredAddress, string memory isDomiciledIn, bool sanStatus){
    require(orgs[org].admins[msg.sender] == true, "You are not authorized to view this data!");
    return(orgs[org].international_securities_identifier, orgs[org].organization_name, orgs[org].hasActivityStatus, orgs[org].businessClassifier, orgs[org].RegisteredAddress, orgs[org].isDomiciledIn, orgs[org].sanStatus);
}
