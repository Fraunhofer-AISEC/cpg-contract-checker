pragma solidity ^0.5.16;

import "./StringUtils.sol";
import "./Accounts.sol";


contract Documents {
    
  address payable private owner;
  address public accountsAddress;
  Document payable[] private documents;
  mapping (address => Count) private counts;
  enum DocStatus {Pending, Verified, Rejected}
  mapping (address => uint) balances;
 
  struct Document {
    address requester;
    address verifier;
    string name;
    string description;
    string docAddress;
    DocStatus status;
  }
  
  struct Count {
    uint verified;
    uint rejected;
    uint total;
  }

  event DocumentAdded (address user);
  event DocumentVerified (address user);
  event test (uint test);

function verifyDocument(string memory docAddress, DocStatus status) 
  public 
  payable
  {
    for (uint i=0; i<documents.length; i++) {
      if(StringUtils.equal(documents[i].docAddress, docAddress) && documents[i].verifier == msg.sender && documents[i].status == DocStatus.Pending){
        emit DocumentVerified(msg.sender);
        uint price = Accounts(accountsAddress).getPrice(documents[i].verifier);
        balances[documents[i].verifier] -= price;
        if(status == DocStatus.Rejected){
            counts[documents[i].requester].rejected = counts[documents[i].requester].rejected + 1;
            counts[documents[i].verifier].rejected = counts[documents[i].verifier].rejected + 1;
            
            documents[i].requester.transfer(price);
        }
        if(status == DocStatus.Verified){
            counts[documents[i].requester].verified = counts[documents[i].requester].rejected + 1;
            counts[documents[i].verifier].verified = counts[documents[i].verifier].verified + 1;
            
            documents[i].verifier.transfer(price);
        }
        documents[i].status = status;
        break;
      }
    }
  }
