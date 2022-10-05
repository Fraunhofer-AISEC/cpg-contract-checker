pragma solidity 0.5.0;

contract DeviceContract {
    struct Device {
        bytes16 hardware_UUID;
        string phone_Number;
    }

    mapping (bytes16 => Device) list_with_devices; 

    function saveDevice(bytes16 _UUID, bytes16 _hardware_UUID, string memory _phone_Number) public returns (bool)  {
        list_with_devices[_UUID] = Device(_hardware_UUID, _phone_Number);
    }

    function getDevice(bytes16 _UUID) public view returns(bytes16, string memory) {
        return (list_with_devices[_UUID].hardware_UUID, list_with_devices[_UUID].phone_Number);
    }
}
