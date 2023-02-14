pragma solidity >=0.4.21 <0.6.0;

import "./CertificateStorageOwnable.sol";

contract CertificateStorage is CertificateStorageOwnable {

    address public certificateAddress;

    event AuthorizedCaller(address caller);
    event DeAuthorizedCaller(address caller);

    function authorizeCaller(address _caller) public onlyOwner returns(bool) {
        authorizedCaller[_caller] = 1;
        emit AuthorizedCaller(_caller);
        return true;
    }

    constructor() public {
        authorizedCaller[msg.sender] = 1;
        emit AuthorizedCaller(msg.sender);
    }

    modifier onlyAuthCaller(){
        certificateAddress = msg.sender;
        require(authorizedCaller[msg.sender] == 1);
        _;
    }
    struct certificate_total {
        string universityName;
        string typeOfDegree;
        string major;
        string name;
        uint256 dateOfBirth;
    }
    mapping(address => certificate_total) certificateTotalMapping;

    certificate_total certificateTotal;

    function setCertificateTotal(string memory _universityName, 
                        string memory _typeOfDegree, 
                        string memory _major, 
                        string memory _name, 
                        uint256 _dateOfBirth) public onlyAuthCaller returns(address) {

        uint tmpData = uint(keccak256(abi.encodePacked(msg.sender, now)));
        address certificateNo = address(tmpData);

        certificateTotal.universityName = _universityName;
        certificateTotal.typeOfDegree = _typeOfDegree;
        certificateTotal.major = _major;
        certificateTotal.name = _name;
        certificateTotal.dateOfBirth = _dateOfBirth;

        certificateTotalMapping[certificateNo]= certificateTotal;

        return certificateNo;
    }
}
