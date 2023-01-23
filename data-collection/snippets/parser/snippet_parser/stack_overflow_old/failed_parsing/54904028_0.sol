pragma solidity 0.5.0;

contract DocumentContract {

    struct Document{ 
        string DocumentNo;
        address DigitalID;
    }

    mapping(string=>Document) doc; 

    function CreateDocument(string calldata DocumentNo,address DigitalID) external {

        doc[DocumentNo] = Document({
            DocumentNo: DocumentNo,
            DigitalID: DigitalID
        });
    }

    function GetDocument(string calldata documentNumber) external view returns(address) {    
        Document memory document = doc[documentNumber]; 
        return (document.DigitalID);        
    }   
}

contract DocInfo {

    function CreateDocument(address digitalID,string memory documentId) public  returns (bool success) {

        address contractAddress =<<Document contract address>>; 
        DocumentContract doc = DocumentContract(contractAddress);
        doc.CreateDocument(documentId,digitalID);

        return true;
    }

    function GetDocument(string memory documentId) 
    public view returns (address) {  

        address contractAddress = <<Document contract address>>;  
        DocumentContract doc = DocumentContract(contractAddress);
        address digitalId = doc.GetDocument(documentId);  
        return digitalId;
    }        
}
