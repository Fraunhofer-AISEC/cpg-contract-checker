contract TransparentUpgradeableProxy is ERC1967Proxy {

constructor(address _logic, address admin_, bytes memory _data) payable ERC1967Proxy(_logic, _data) {
    _changeAdmin(admin_);
}
}