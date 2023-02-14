function addDevice(address _address, string _deviceType, string _deviceName, string _minerID, string _deviceID) public
{
    DeviceData storage device = devices[_address];

    device.deviceType = _deviceType;
    device.deviceName = _deviceName;
    device.minerID = _minerID;
    device.deviceID = _deviceID;

    devicesAddresses.push(_address) -1;
}
