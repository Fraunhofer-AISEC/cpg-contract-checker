contract A {
  bool public requirement;
  
  function foo() public {
     require(requirement, "State not set correctly for continuation");
     ...
  }
}
