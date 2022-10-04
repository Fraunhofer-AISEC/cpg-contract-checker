pragma solidity ^0.4.21;

contract MyToken {
    
    mapping (uint64 => Certificate) public certificates;
    uint64 numCertificates = 1;

    

    function MyToken() public {
      
    }

    function produceCertificate(
      
      ) public {
        
        numCertificates;
        Certificate storage newCertificate = constructCertificate(meterId, timestamp, carbonMitigationValue, owner);
        uint64 newCertificateId = numCertificates;
        newCertificate.certificateId = newCertificateId;

        
        certificates[newCertificateId] = newCertificate;
        numCertificates++;
    }



    function constructCertificate(
      uint64 meterId,
      uint32 timestamp,
      uint48 value,
      address owner
      ) internal returns (Certificate storage newCertificate) {
        newCertificate.meterId = meterId;
        newCertificate.timestamp = timestamp;
        newCertificate.value = value;

        newCertificate.owners.push(owner);
        newCertificate.ownershipSplit[owner] = value;

        newCertificate.burned = false; 

        return newCertificate;
    }
}
