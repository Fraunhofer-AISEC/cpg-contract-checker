address[] private _storageBeacons;

function storageBeacon(uint version_) external view returns(address) {
    return _storageBeacons[version_];
}
