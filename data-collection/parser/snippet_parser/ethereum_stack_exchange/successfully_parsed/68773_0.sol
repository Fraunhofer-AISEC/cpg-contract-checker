pragma solidity ^0.5.0;

contract Certs {

    mapping(address => string) requests;
    address professorAddr;

    modifier onlyProfessor() {
        require(msg.sender == professorAddr);
        _;
    }

    function requestCert(string memory certName) public {
        requests[msg.sender] = certName;
    }



    function approve(address requestAddr) public onlyProfessor {
        delete requests[requestAddr];
        

    }
 }
