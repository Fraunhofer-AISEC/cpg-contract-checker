pragma solidity ^0.5.10;

contract AttendanceSystemContract {
    
    struct Attendance {
        uint attendanceID;
        address employeeAddressID;
        string employeeName;
        string checkinDate;
        string checkinTime;
        string checkoutDate;
        string checkoutTime;
        string workChoice;
    }

    
    mapping (uint => Attendance) public attendanceList;
    uint public attendanceCount;

    
    
    function takeAttendance (address _employeeAddressID, string memory _employeeName, string memory _checkinDate, string memory _checkinTime, string memory _checkoutDate, string memory _checkoutTime, string memory _workChoice) public {
        attendanceCount++;
        attendanceList[attendanceCount] = Attendance(attendanceCount, _employeeAddressID, _employeeName, _checkinDate, _checkinTime, _checkoutDate, _checkoutTime,  _workChoice);
    }

    
    function updateAttendance (uint _attendanceID, string memory _checkoutDate, string memory _checkoutTime) public {
        Attendance memory attendanceObject = attendanceList[_attendanceID];
        attendanceObject.checkoutDate = _checkoutDate;
        attendanceObject.checkoutTime = _checkoutTime;
        attendanceList[_attendanceID] = attendanceObject;
    }

    
    function retrieveAttendance(address _employeeAddressID) public view returns (uint, address, string memory, string memory, string memory, string memory, string memory, string memory) {
        return (attendanceList[_employeeAddressID].attendanceID, attendanceList[_employeeAddressID].employeeAddressID, attendanceList[_employeeAddressID].employeeName, attendanceList[_employeeAddressID].checkinDate, attendanceList[_employeeAddressID].checkinTime, attendanceList[_employeeAddressID].checkoutDate, attendanceList[_employeeAddressID].checkoutTime, attendanceList[_employeeAddressID].workChoice);
    }
  }
}
