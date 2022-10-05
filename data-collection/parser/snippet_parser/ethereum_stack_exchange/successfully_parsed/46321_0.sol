contract Test{
  bytes4 public method;
  string public method_s;

  function Test() {
    method = this.get_f.selector;
  }

  function makeString(){
   method_s = somefunc(method);
  }

}
