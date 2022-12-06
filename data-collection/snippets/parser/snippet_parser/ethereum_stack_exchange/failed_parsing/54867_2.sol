modifier passwordRequired(string _pw){
  require(keccak256(_pw) == keccak256("topSecret"));
  _;
}

function doSomething(unit _param, string _pw) public passwortRequired(_pw){
  ...
}
