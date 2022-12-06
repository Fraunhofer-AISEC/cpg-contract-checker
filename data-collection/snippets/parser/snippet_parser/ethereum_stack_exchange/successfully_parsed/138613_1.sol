
pragma solidity >=0.7.0 <0.9.0;

contract CertData {
  Cert[] private certs;
  mapping(address => Cert[]) private authorToCerts;

  struct Cert {
    string title;
    string description;
    string owner;
  }

  function store(string memory title, string memory description, string memory owner) public {
    Cert memory cert = Cert(title, description, owner);

    certs.push(cert);
    authorToCerts[msg.sender].push(cert);
  }

  function retrieveAllCerts() public view returns (Cert[] memory) {
    return certs;
  }

  function retrieveCertsByAuthor() public view returns (Cert[] memory) {
    return authorToCerts[msg.sender];
  }
}
