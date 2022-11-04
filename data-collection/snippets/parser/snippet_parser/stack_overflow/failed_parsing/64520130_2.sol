pragma solidity 0.6.6;


import 'https://github.com/OpenZeppelin/openzeppelin- 
solidity/contracts/math/SafeMath.sol';

contract Certification {
using SafeMath for uint256;

address private owner;

struct Certificate {
    string name;
    string lastName;
    string certificationName;
    string instructorName;
    uint256 dueDate;
    uint256 expirationDate;
}


Certificate[] public certifications;

mapping(uint => uint) public dniToCertification;




event certificateSubscribed(string name, string lastname, uint dni, string certification, string instructor, uint256 date, uint256 untilDate);

constructor() public {
    owner = msg.sender;
}

modifier isOwner() {
    require(owner == msg.sender);
    _;
}

function subscribeCertificate(
    string memory name,
    string memory lastname,
    uint dni,
    string memory certificationName,
    string memory instructorName,
    uint256 dueDate,
    uint256 expirationDate) public isOwner {
        
        
        certifications.push(Certificate(
           name,
           lastname,
           certificationName,
           instructorName,
           dueDate,
           expirationDate));

        uint id = certifications.length - 1;
        
        dniToCertification[dni] = id;
        
        
        emit certificateSubscribed(name, lastname, dni, certificationName, instructorName, dueDate, expirationDate);
}

}
