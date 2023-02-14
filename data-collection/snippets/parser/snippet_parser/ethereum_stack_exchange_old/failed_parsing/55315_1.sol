contract Parent{
  function fallback() internal {
    log0("Parent fallback function");
  }

  function (){
     fallback();
  }
}

contract Child is Parent {
  function (){
    log0("child fallback function");
    super.fallback();
  }
}
