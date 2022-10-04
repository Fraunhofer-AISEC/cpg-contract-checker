contract_code = """ 
contract bug {
    function load_money() returns (uint32) {

       if(msg.value != 10) {
          return(0);
       }
    }
}
"""

# Create the contract
contract = s.abi_contract(contract_code, language='solidity')

# Transfer money
contract.load_money(value=5, sender=tester.k0) 
