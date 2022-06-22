function sendEtherAndCall(address maliciousRecipient) external preventRentrant{
 uint someEther = balances[maliciousRecipient];
 balances[maliciousRecipient] = 0;
 bool success = maliciousRecipient.send(someEther);
 maliciousContract.call("Some function that uses SWAP 16");
 if(!success) balances[maliciousRecipient] = someValue; 
} 
