pragma solidity ^0.4.6;

contract TwoSigs {

    address public partyA;
    address public partyB;

    struct documentStruct {
        bool approvedByA;
        bool approvedByB;
    }

    

    mapping(bytes32 => documentStruct) public documentStructs;
    bytes32[] public documentList; 
    bytes32[] public approvedDocuments; 

    

    event LogProposedDocument(address proposer, bytes32 docHash);
    event LogApprovedDocument(address approver, bytes32 docHash);

    

    function TwoSigs(address addressA, address addressB) {
        partyA = addressA;
        partyB = addressB;
    }

    
    function getDocumentsCount() public constant returns(uint docCount) {
        return documentList.length;
    }

    function getApprovedCount() public constant returns(uint apprCount) {
        return approvedDocuments.length;
    }

    

    function agreeDoc(bytes32 hash) public returns(bool success) {
        if(msg.sender != partyA && msg.sender != partyB) throw; 
        if(msg.sender == partyA) documentStructs[hash].approvedByA = true; 
        if(msg.sender == partyB) documentStructs[hash].approvedByB = true; 

        if(documentStructs[hash].approvedByA == true && documentStructs[hash].approvedByB == true) {
            uint docCount = documentList.push(hash);
            LogApprovedDocument(msg.sender, hash);
        } else {
            uint apprCount = approvedDocuments.push(hash);
            LogProposedDocument(msg.sender, hash);
        }
        return true;
    }

}
