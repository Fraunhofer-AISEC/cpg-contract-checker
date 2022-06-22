  struct Inbox {
    uint numSentMessages;
    uint numReceivedMessages;
    mapping (uint => Message) sentMessages;
    mapping (uint => Message) receivedMessages;
  }

  mapping (address => Inbox) userInboxes;
  mapping (address => bool) hasRegistered;

  Inbox[] newInbox;
  uint donationsInWei = 0;
  Message newMessage;
  ContractProperties contractProperties;

  

function clearInbox() public {
     userInboxes[msg.sender]=newInbox;
           
  }

  function registerUser() public {
    if(!hasRegistered[msg.sender]) {
      userInboxes[msg.sender]=newInbox;
      hasRegistered[msg.sender] = true;
      contractProperties.registeredUsersAddress.push(msg.sender);
      
    }
  }

