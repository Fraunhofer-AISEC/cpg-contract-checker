from solcx import install_solc, compile_source


install_solc(version='latest')

# compile all contract files
compiled_sol = compile_source(
    '''
     pragma solidity >0.5.0;

     contract Greeter {
         string public greeting;

         constructor() public {
             greeting = 'Hello';
         }

         function setGreeting(string memory _greeting) public {
             greeting = _greeting;
         }

         function greet() view public returns (string memory) {
             return greeting;
         }
     }
     ''',
    output_values=['abi', 'bin']
)

contract_id, contract_interface = compiled_sol.popitem()
bytecode = contract_interface['bin']
