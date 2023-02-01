    pragma solidity ^0.4.2;

    
    contract CertificationStore {

        struct Certification {
            string firstName;
            string lastName;
            string certName;
            string institution;
            string description;
            uint year;
            uint month;
            uint day;
        }

        mapping (address => Certification) public certifications;

        Certification[] public certArray;
        address[] public addressIdx;

        uint numCerts;

        Certification public aCert; 

        event Send(address indexed _from);

        function CertificationStore() {
        }

        function getCertArrayLength() returns(uint) {
            return certArray.length;
        }

        function getAddressIdxLength() returns(uint) {
            return addressIdx.length;
        }

        function sendCert(address acct, string fn, string ln, string cn, 
            string ins, string desc, uint yy, uint mm, uint dd) returns(uint certId) {


            certifications[acct] = Certification({
                    firstName: fn,
                    lastName: ln,
                    institution: ins,
                    description: desc,
                    certName: cn,
                    year: yy,
                    month: mm,
                    day: dd
                });

            certId = numCerts++;

            addressIdx[certId] = acct;
            certArray[certId] = Certification({
                    firstName: fn,
                    lastName: ln,
                    institution: ins,
                    description: desc,
                    certName: cn,
                    year: yy,
                    month: mm,
                    day: dd
                });
            Send(acct);

        }

        function getFirstName(address _from) public returns(string) {
            for (uint i = 0; i < certArray.length; i++) {
                Certification cert = certArray[i];
                string name = cert.firstName;
                address acct = addressIdx[i];
                if(acct == _from) {
                    return name;
                }
            }

            return ("no name found");
        }

    }
