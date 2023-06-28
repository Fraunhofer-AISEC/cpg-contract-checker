pragma solidity ^0.5.11;

contract Notary2 {

    struct Document {
        address[] signatures;
        string documentToSign;  
        string signaturesSring;
    }

    address payable public owner;
    Document[] public documents;
    int public lastId = -1;
    uint256 documentCreationPrice = 0.001 ether;
    uint256 signaturePrice = 0.0001 ether;
    address[] temp;

    event Status(string _msg, address user, uint256 time);

    constructor() public{
        owner = msg.sender;
        emit Status('Notary Created', msg.sender, block.timestamp);
    }

    function createDocument(string memory _document) public payable {
        if(msg.value != documentCreationPrice) {
            revert();
        }
        
        temp.push(msg.sender);
        documents.push(Document({
                documentToSign: _document,
                signatures: temp,
                signaturesSring: addresstoString(msg.sender)
            }));
        delete temp[0];
        emit Status('New Document Created', msg.sender, block.timestamp);
        emit Status('New Document ID at Last row:', msg.sender, uint256(lastId));
        lastId += 1;
        owner.transfer(address(this).balance);
    }

    function signDocument(int id) public payable {
        if(msg.value != signaturePrice) {
            revert();
        }
        if(id <= lastId) {
            documents[uint256(id)].signatures.push(msg.sender);
            documents[uint256(id)].signaturesSring += bytes32ToString(msg.value);
        }
        emit Status('Signed Document ID at Last row:', msg.sender, uint256(id));
        emit Status('New Signature On Document', msg.sender, block.timestamp);
        owner.transfer(address(this).balance);
    }

    function bytes32ToString (bytes32 data) public returns (string memory) {
        bytes memory bytesString = new bytes(32);
        for (uint j=0; j<32; j++) {
            byte char = byte(bytes32(uint(data) * 2 ** (8 * j)));
            if (char != 0) {
                bytesString[j] = char;
            }
        }
        return string(bytesString);
    }
    function addresstoString(address x)public returns (string memory) {
        bytes memory b = new bytes(20);
        for (uint i = 0; i < 20; i++)
            b[i] = byte(uint8(uint(x) / (2**(8*(19 - i)))));
        return string(b);
    }

}
