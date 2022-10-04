def __init__(self, nonce, gasprice, startgas, to, value, data, v=0, r=0, s=0):

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

    to = b''
    data = codecs.decode(bytecode, 'hex_codec')
    super(Transaction, self).__init__(nonce, gasprice, startgas, to, value, data, v, r, s)

    if gasprice >= TT256 or startgas >= TT256 or value >= TT256 or nonce >= TT256:
        logging.error("Values way too high!")
