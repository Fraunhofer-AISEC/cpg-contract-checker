pragma solidity ^0.5.4;
pragma experimental ABIEncoderV2;

contract MedicalHistory {
    struct medicalData {
        address provider_address;
        string date;
        string[] medicine_name;
        uint[] quantity;
    }
    mapping (address=>medicalData[]) medicalDataHistory;

    function getData() public view returns(medicalData[] memory) {
        return medicalDataHistory[msg.sender];
    }
    function setData(address a,string memory d, string[] memory s, uint[] memory u) public {
        medicalData memory m = medicalData(a, d, s, u);
        medicalDataHistory[msg.sender].push(m);
    }
}
