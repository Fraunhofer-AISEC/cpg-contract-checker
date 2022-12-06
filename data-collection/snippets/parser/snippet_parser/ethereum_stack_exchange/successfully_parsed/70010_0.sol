pragma solidity >=0.4.21 <0.6.0;

import "./CertificateOwnable.sol";
import "./CertificateStorage.sol";

contract Certificate is CertificateOwnable {

    CertificateStorage certificateStorage;

    constructor(address _certificateAddress) public {
        certificateStorage = CertificateStorage(_certificateAddress);
    }

    function addCertificateTotal(string memory _universityName, 
                        string memory _typeOfDegree, 
                        string memory _major, 
                        string memory _name, 
                        uint256 _dateOfBirth) public onlyOwner returns(address) {

        address certificateNo = certificateStorage.setCertificateTotal(_universityName, 
                                                            _typeOfDegree, 
                                                            _major, 
                                                            _name, 
                                                            _dateOfBirth);

        return (certificateNo);
    }
}
