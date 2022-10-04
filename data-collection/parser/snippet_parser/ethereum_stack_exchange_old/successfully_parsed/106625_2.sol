function addOrg(address org, uint _identifier, string calldata _organization_name, bool _ActivityStatus, string calldata _Classifier, string calldata _Address, string calldata _DomiciledIn, bool _Status) external{
    Org storage organization = orgs[org];
    organization.identifier = _identifier;
    organization.organization_name = _organization_name;
    organization.ActivityStatus = _ActivityStatus;
    organization.Classifier = _Classifier;
    organization.Address = _Address;
    organization.DomiciledIn = _DomiciledIn;
    organization.Status = _Status;
    organization.admins[msg.sender] = true;
}
