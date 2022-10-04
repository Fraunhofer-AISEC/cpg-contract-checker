Contract A {
  mapping (address => bool) public allowed;
  mapping (address => uint) public userData;

  function doSomething(address _user) public returns(bool){
    if(allowed[_user]){ 
      userData[_user]++;
      return true;
    } else
      return false;  
  }
}

Contract B {
  function doSomethingWithA(){
     A contractA = A(_Aaddress);
     if(contractA.doSomething(msg.sender))
       
     else
       
  }
}
