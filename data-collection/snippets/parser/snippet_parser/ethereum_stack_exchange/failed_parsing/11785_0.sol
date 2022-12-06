    contract A  {
        function A(address[] _owners, uint _required) {
        }
    }

    contract B is A {
        function B()
          A(new address[](0),0)) { 
        }
    }

    contract C is A {
       function C() 
         A([0x123],0) { 
       }
    }
