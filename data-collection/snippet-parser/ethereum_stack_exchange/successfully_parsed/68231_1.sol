pragma solidity 0.5.1;

contract Certificates {

    struct Cert {
        address recipient;
        bool confirmed;
    }

    mapping(bytes32 => Cert) public certs;
    bytes32[] public certList;

    event LogNewCert(address sender, bytes32 cert, address recipient);
    event LogConfirmed(address sender, bytes32 cert);

    function isCert(bytes32 cert) public view returns(bool isIndeed) {
        if(cert == 0) return false;
        return certs[cert].recipient != address(0);
    }

    function createCert(bytes32 cert, address recipient) public {
        require(recipient != address(0));
        require(!isCert(cert));
        Cert storage c = certs[cert];
        c.recipient = recipient;
        certList.push(cert);
        emit LogNewCert(msg.sender, cert, recipient);
    }

    function confirmCert(bytes32 cert) public {
        require(certs[cert].recipient == msg.sender);
        require(certs[cert].confirmed == false);
        certs[cert].confirmed = true;
        emit LogConfirmed(msg.sender, cert);
    }

    function isUserCert(bytes32 cert, address user) public view returns(bool) {
        if(!isCert(cert)) return false;
        if(certs[cert].recipient != user) return false;
        return certs[cert].confirmed;
    }
}
