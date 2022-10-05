 pragma solidity >= 0.4 .22 < 0.6 .0;

 contract DocumentManager {

 mapping(uint => Document) documents;
 uint public nbDocuments;
 address public owner;

 enum Status {
    UNKNOWN,
    OPEN,
    DONE,
    DENIED
 }

struct Document {
    address owner;
    string document;
    string name;
    uint nbRequests;
    string privateKey;
    mapping(uint => Request) requests;
}

struct Request {
    address owner;
    Status status;
    string key;
}

constructor() public {
    owner = msg.sender;
}

function newDocument(string memory hash, string memory name) public {
    nbDocuments++;
    documents[nbDocuments].owner = msg.sender;
    documents[nbDocuments].document = hash;
    documents[nbDocuments].name = name;
    documents[nbDocuments].nbRequests = 0;
}

  function grantAccess(uint documentId, uint requestId, string memory 
   encryptedKey) public {
    uint256 document = documents[documentId];
    if (document.owner == msg.sender) {
        document.requests[requestId].status = Status.DONE;
        document.requests[requestId].key = encryptedKey;
     }
  }

 function denyAccess(uint documentId, uint requestId) public {
    uint256 document = documents[documentId];
    if (document.owner == msg.sender) {
        document.requests[requestId].status = Status.DENIED;
    }
 }

   function requestDocument(uint documentId, string memory publicKey) 
    public {
    uint256 document = documents[documentId];
    document.nbRequests++;
    uint256 request = document.requests[document.nbRequests];
    request.status = Status.OPEN;
    request.owner = msg.sender;
    request.key = publicKey;
  }

  function getLastRequestId(uint documentId) public returns(uint) {
    return documents[documentId].nbRequests;
   }

  function getOpenRequestPublicKey(uint documentId, uint requestId) 
   public returns(string memory) {
    uint256 request = documents[documentId].requests[requestId];
    if (request.status == Status.OPEN) {
        return request.key;
    }
    return "";
  }

function getRequestOwner(uint documentId, uint requestId) public 
  returns(address) {
    uint256 document = documents[documentId];
    if (document.owner == msg.sender) {
        return document.requests[requestId].owner;
    }
 }

function getDocument(uint documentId) public returns(string memory 
  hash) {
    return documents[documentId].document;
}

function getDocumentName(uint documentId) public returns(string memory 
 name) {
    return documents[documentId].name;
}

function getEncryptedKeyFromRequest(uint documentId, uint requestId) 
 public returns(string memory) {
    uint256 request = documents[documentId].requests[requestId];
    if (request.status == Status.DONE) {
        return request.key;
    }
    return "";
}

function getDocumentHash(uint documentId) public returns(string 
 memory) {
    return documents[documentId].document;
}

function getRequestStatus(uint documentId, uint requestId) public 
 returns(Status) {
    return documents[documentId].requests[requestId].status;
 }

}
