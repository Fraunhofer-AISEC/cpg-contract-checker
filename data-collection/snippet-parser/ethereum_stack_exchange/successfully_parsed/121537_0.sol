pragma solidity ^0.8.0;
    
contract IoTDataStorage {
    struct IoT {
        string date;         
        uint data;  
        bool status;       
    }
 
mapping (address => IoT) public iotDevice;

function set(string memory _date, uint _data, bool _status) public returns(bool) {
        iotDevice[msg.sender].date = _date;
        iotDevice[msg.sender].data = _data;
        iotDevice[msg.sender].status = _status;
        return true;
    }

    function get() public view returns(IoT memory) {
        return iotDevice[msg.sender];
    }
}
