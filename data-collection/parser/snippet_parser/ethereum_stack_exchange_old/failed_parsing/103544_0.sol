contract A {

 ...

   bool response = B(address).doSomething(msg.sender);
 ...

contract B {

   function doSomething(address sender) public onlyTrustedSender {returns bool) {
     ...

