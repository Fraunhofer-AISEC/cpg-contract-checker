pragma solidity ^0.4.23;


contract CareerCertificate {

struct Certificate {

    bytes32 a;
    bool b;
    uint c;

    bytes32 d;
    bytes32 e;
    bytes32 f;
    bytes32 g;
    bytes32 h;


    bytes32 i;
    bytes32 j;
    bytes32 k;

    uint l;
    uint m;

    bool active;
}


address public ceoAddress;
address public employee;

mapping (bytes32 => Certificate) public certificates;

event CertificateCreated(address creator, string id, string RUT);
event SetActive(address responsable, string id, bool active, string description);

constructor() public {
    ceoAddress = msg.sender;
}


function createCertificate(string _a, uint _date, string _completeName, string _RUT, string _institution, string _RutInstition, string _title, string _FechaTitulacion, 
string _NroRegistro, string _CodigoVerificacion, uint _completionDate, uint _registerNumber) onlyEmployees {

    bytes32 realId = convert(_a);
    require(!certificateExists(_a));
    certificates[realId].a = a;
