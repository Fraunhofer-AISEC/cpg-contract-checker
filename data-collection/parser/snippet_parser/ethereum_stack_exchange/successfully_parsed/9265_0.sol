

pragma solidity ^0.4.2;

contract EmailServer {
  address owner;
  bytes[] inbox;

  function EmailServer() {
    owner = msg.sender;
  }

  function addEmail(bytes x) constant {
    inbox.push(x);
  }

  function getInboxCount() returns (uint count) {
    return inbox.length;
  }

  function getEmails() returns (bytes email) {
    bytes emailsOutput;
    uint inboxCount = getInboxCount();
    uint emailLength;

    if (inboxCount == 0) {
      throw;
    }

    emailsOutput.push('[');
    for (uint i = 0; i < inboxCount; i++) {
      emailLength = inbox[i].length;
      emailsOutput.push('"');
      for (uint j = 0; j < emailLength; j++) {
        emailsOutput.push(inbox[i][j]);
      }
      emailsOutput.push('"');

      if (i < inboxCount - 1) {
        emailsOutput.push(',');
      }
    }
    emailsOutput.push(']');

    return emailsOutput;
  }

  function getOwner() returns (address) {
    return owner;
  }

  
  function kill() {
    if (msg.sender == owner) {
      suicide(owner);
    }
  }
}
