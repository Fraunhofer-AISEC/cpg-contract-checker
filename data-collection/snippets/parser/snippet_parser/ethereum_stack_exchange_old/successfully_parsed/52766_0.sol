contract Caller {

  function doSomething(string _text, address _callee) public {
     bool valid = bool(_callee.delegatecall(
                          bytes4(keccak256("check(string _text)")), _text)
                  );

     require(valid == true);
     
  }
}

contract Callee {

  function check(string _text) public view returns(bool){
    
    return true;
  }
}
