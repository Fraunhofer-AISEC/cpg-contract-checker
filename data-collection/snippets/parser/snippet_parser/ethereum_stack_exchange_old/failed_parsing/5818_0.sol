In [34]: print c
contract NameReg{
    event AddressRegistered(bytes32 indexed name, address indexed account);
    mapping(address => bytes32) toName;

    function register(bytes32 name){
        toName[msg.sender] = name;
        AddressRegistered(name, msg.sender);
    }

    function resolve(address addr) constant returns(bytes32 name){
        return toName[addr];
    }
}


In [35]: solidity.compile(c)
---------------------------------------------------------------------------
IndexError                                Traceback (most recent call last)
<ipython-input-35-7d9906629614> in <module>()
----> 1 solidity.compile(c)

/home/work/Software/ethereum/pyethapp/.venv/local/lib/python2.7/site-packages/ethereum/_solidity.pyc in compile(cls, code, path, libraries, contract_name)
     51                 sorted_contracts[idx][1]['bin'] = sorted_contracts[idx][1]['bin'].replace(
     52                     "__{}{}".format(lib_name, "_" * (38 - len(lib_name))), lib_address)
---> 53         return sorted_contracts[idx][1]['bin'].decode('hex')
     54 
     55     @classmethod

IndexError: list index out of range
