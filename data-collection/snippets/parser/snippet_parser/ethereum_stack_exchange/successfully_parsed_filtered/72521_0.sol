struct Device
{
    bytes16 UUID;
    bytes16 hardware_UUID;
    string phone_Number;
}

function SaveDevice(Device memory device) public returns (bool)

{
    Device_Table[device.UUID]=device;
    Device_HardTable[device.hardware_UUID]=device;
}
