pragma solidity ^0.4.2;

  contract ContractB {
    string private name;

    function set_name(string _name) {
      name = _name;
    }

    function get_name() returns(string) {
      return name;
    }
  }

  contract ContractC {
    string private name;

    function set_name(string _name) {
        name = _name;
    }

    function get_name() returns(string) {
        return name;
    }
  }

  contract ContractA {
    ContractB public contractBvar;
    ContractC public contractCvar;

    
    function ContractA() {
        contractBvar = new ContractB();
        contractBvar.set_name("contractB");
    }


    function createContractC() {
        contractCvar = new ContractC();
        contractCvar.set_name("contractC");
    }
  }
