contract Customer{
  bool public state = false;

  function initCustomerContract() onlyMasterAccess{    
    state = true;
  }

  function foo() checkMasterAndAdminAccess{
    
    
  }

  function bar(){
    
  }   
}
