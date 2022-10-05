 bool private isInit=false;
 string private hello;
 
 function init(string _hello) public onlyOwner {
   hello = _hello;
   isInit = true;
 } 

 function doSomething() public {
   require(isInit, "Wait for initialize");
   ...doSomething
 }
