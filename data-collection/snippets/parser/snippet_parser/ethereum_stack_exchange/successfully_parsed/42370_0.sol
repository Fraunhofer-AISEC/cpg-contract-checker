pragma solidity ^0.4.17;

contract Applications {

  address applicant;

  mapping(uint => string) Application;

  function Applications() internal {
    applicant = msg.sender;
  } 

  modifier ifApplicant() {
    if (applicant != msg.sender) {
      revert();
    } else {
      _;
    }
  }

  function setApplication(uint id, string data) public {
    Application[id] = data;
  }

  function getApplication(uint id) ifApplicant public view returns (string) {
     return Application[id];
  }
}
