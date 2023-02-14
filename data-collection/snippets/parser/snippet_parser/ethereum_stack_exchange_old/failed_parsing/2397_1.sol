 from ethereum import tester as t

 code = '''
    contract Example {
       struct Person {
         string name;
       }
       mapping(string => Person) map;

       function setName(string name, string value) {
          map[name] = Person({name: value});
       }

       function getName(string key) constant returns (string) {
         return map[key].name;
       }

   }
  '''

   state = t.state()
   contract =  state.abi_contract(code, language='solidity')
   contract.setName('dave', 'hello')
   print contract.getName('dave')
   => 'hello'
