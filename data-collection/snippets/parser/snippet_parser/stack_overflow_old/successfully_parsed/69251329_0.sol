contract DigitalLocker{
    address public Owner;
    address public BankAgent;
    address public ThirdPartyRequestor;
    address public CurrentAuthorizedUser ;
    
    struct ForTheDocument{
        uint DocumentId;
        string DocumentName;
        DigitalLockerState States;
    }
    
    mapping(uint=>ForTheDocument)public ForTheDocuments;
    uint public DocumentCount;
    enum DigitalLockerState{Create,DocumentReview,AvailableToShare,SharingWithThirdParty,Terminated}
    constructor(uint _DocumentId,string memory _DocumentName,address _BankAgent){
        Owner=msg.sender;
        ForTheDocuments[DocumentCount].DocumentId=_DocumentId;
        ForTheDocuments[DocumentCount].DocumentName=_DocumentName;
        BankAgent=_BankAgent;
        ForTheDocuments[DocumentCount].States=DigitalLockerState.Create;
        DocumentCount++;
        
        
    }
    
    function BeginReviewProcess(uint _DocumentIdForProcess)public{
        if(BankAgent!=msg.sender){
            revert("This is not a BankAgent Account");
        }
        BankAgent=msg.sender;
        ForTheDocuments[DocumentCount].DocumentId=_DocumentIdForProcess;
        ForTheDocuments[DocumentCount].States=DigitalLockerState.DocumentReview;
    }
    function UploadDocument(uint _DocumentIdForUpload)public{
        if(BankAgent!=msg.sender){
            revert("This is not a Bank agent account and you are not Capable to upload the Document");
        }
        ForTheDocuments[DocumentCount].DocumentId=_DocumentIdForUpload;
        BankAgent=msg.sender;
        ForTheDocuments[DocumentCount].States=DigitalLockerState.AvailableToShare;
    }
}
