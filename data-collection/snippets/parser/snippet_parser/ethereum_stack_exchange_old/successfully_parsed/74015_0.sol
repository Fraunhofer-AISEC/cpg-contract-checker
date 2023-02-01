pragma solidity ^0.5.0;

contract company {

    struct contractDetails {
        string contractId;
        string companyA;
        string companyB;
        address A;
        address B;
        uint256 timestamp;
        string signHash;
        bool isSigned;
    }

    mapping (string => contractDetails) contracts;
    mapping (string => string) hashMap;

    event contractSigned (
        string contractId,
        string companyA,
        string companyB,
        address A,
        address B,
        uint256 timestamp,
        string signHash,
        bool isSigned
    );

    function createContract(string memory _contractId, string memory _companyA, string memory _companyB, address _B) public {
        contracts[_contractId] = contractDetails(_contractId, _companyA, _companyB, msg.sender, _B, now, '', false);
    }

    function signContract(string memory _contractId) public {
        contractDetails storage signDetails = contracts[_contractId];
        signDetails.isSigned = true;
        signDetails.timestamp = now;
        emit contractSigned(_contractId, signDetails.companyA, signDetails.companyB, signDetails.A, signDetails.B, signDetails.timestamp, signDetails.signHash, signDetails.isSigned);
    }

    function verifySign(string memory _contractId) public view returns(bool) {
        contractDetails storage verify = contracts[_contractId];
        return(verify.isSigned);
    }

    function getContract(address _address) view public returns() {
      
    }
}
