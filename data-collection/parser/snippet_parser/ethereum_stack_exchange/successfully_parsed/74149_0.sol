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

    mapping (address => contractDetails) contractAddr;
    uint public counter = 0;

     function createContract(string memory _contractId, string memory _companyA, string memory _companyB, address _B) public {
        counter++;
        contractAddr[_B] = contractDetails(_contractId, _companyA, _companyB, msg.sender, _B, now, '', false);
    }

function getAllContracts(address _address) public view returns(contractDetails[] memory) {
        contractDetails[] memory y = new contractDetails[];
        for(uint i = 0; i < counter; i++) {
            y[i] = contractAddrArr[i];
        }
        return(y);
    }
}
