  function invest() external payable {
 
    balanceOfContract=balanceOfContract+msg.value;
 
    mydata[id].participantETHamount = msg.value;
    mydata[id].participantsAddress = msg.sender;
    id++;

  }
