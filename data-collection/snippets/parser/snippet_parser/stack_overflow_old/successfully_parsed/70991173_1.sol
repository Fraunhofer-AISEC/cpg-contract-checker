
pragma solidity ^0.8.6;

contract KeepPolicy {

    struct Policy {
        string hashId;
        string hashHospitalString;
        string encHospitalString;
        string encPub;
    }

    uint256 countId;
    mapping (uint256 => Policy) public policies;

    receive() external payable {}

    function setPolicy(string memory _hashId, string memory _hashHospitalString, string memory _encHospitalString, string memory _encPub)
    external payable {
        uint256 count = countId++;
        policies[count].hashId = _hashId;
        policies[count].hashHospitalString = _hashHospitalString;
        policies[count].encHospitalString = _encHospitalString;
        policies[count].encPub = _encPub;
    }
}
