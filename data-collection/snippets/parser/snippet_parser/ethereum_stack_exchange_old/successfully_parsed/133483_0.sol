contract MyContract{
 string private sampleString;
 event getStringEv(string indexed msg);
 function getEvFn() public{
  emit getStringEv(sampleString);
 }
 function setsampleStringFn(string memory _msg) public{
 
 }
}
