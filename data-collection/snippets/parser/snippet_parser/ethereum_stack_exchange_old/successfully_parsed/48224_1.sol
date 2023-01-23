contract UploadFactory is Managers{
    constructor(address[] _managerAddresses) public Managers(_managerAddresses) {}
}
