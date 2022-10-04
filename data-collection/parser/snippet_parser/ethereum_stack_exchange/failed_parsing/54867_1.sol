 modifier passwordRequired(string _pw){
  require(keccak256(_pw) == keccak256("topSecret"));
  _;
}

function doSomething(string _param) public passwordRequired(_param){
  
} 
