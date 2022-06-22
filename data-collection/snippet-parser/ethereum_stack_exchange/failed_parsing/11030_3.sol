> myContractCompiled
myContractCompiled
{
  Array: {
    code: "0x6060604081905260008054600160a060020a0319166c01000000000000000000000000338102041781557f14ea1cf8000000000000000000000000000000000000000000000000000000008252600160645273__LinkedList____________________________916314ea1cf89160849160248186803b1560025760325a03f41560025750505060fd806100936000396000f3606060405260e060020a60003504631309238c8114603a578063896f40dd1460525780638da5cb5b146071578063f2fde38b146086575b6002565b34600257600160408051918252519081900360200190f35b3460025760a860005433600160a060020a0390811691161460c6576002565b3460025760aa600054600160a060020a031681565b3460025760a860043560005433600160a060020a0390811691161460c8576002565b005b60408051600160a060020a039092168252519081900360200190f35b565b600080546c010000000000000000000000008084020473ffffffffffffffffffffffffffffffffffffffff199091161790555056",
    info: {
      abiDefinition: [{...}, {...}, {...}, {...}, {...}],
      compilerOptions: "--combined-json bin,abi,userdoc,devdoc --add-std --optimize",
      compilerVersion: "0.4.4",
      developerDoc: {
        methods: {}
      },
      language: "Solidity",
      languageVersion: "0.4.4",
      source: "library LinkedList { uint80 constant None = uint80(0);  struct data { uint256 head;  Node[100] n;  uint size; uint insert_number; uint buffer_size; } struct Node { string data;  address owner;  uint own;  uint prev; uint next;  } function construct_me(data storage self){  self.n[0].own = 0; self.n[0].next = 0; self.n[0].prev = 0; self.head = 0; self.insert_number = self.size = 1;  self.buffer_size = 100; }}contract owned {  address public owner; function owned() { owner = msg.sender; } function ownerOnly() { if (msg.sender != owner) throw; } modifier onlyOwner { if (msg.sender != owner) throw; _; } function transferOwnership(address newOwner) onlyOwner { owner = newOwner; }}contract Array is owned { using LinkedList for LinkedList.data; using LinkedList for LinkedList.Node; LinkedList.data list; function Array(){  if( test_callstack() != 1 ) throw;  list.construct_me(); } function test_callstack() constant returns ( int ){ return 1; }}",
      userDoc: {
        methods: {}
      }
    }
  },
  LinkedList: {
    code: "0x6060604052605c8060106000396000f36504044633f3de50606060405260e060020a600035046314ea1cf881146024575b6007565b600060036004803591820183905560058201839055810182905590815560016101f582018190556101f682015560646101f79091015500",
    info: {
      abiDefinition: [{...}],
      compilerOptions: "--combined-json bin,abi,userdoc,devdoc --add-std --optimize",
      compilerVersion: "0.4.4",
      developerDoc: {
        methods: {}
      },
      language: "Solidity",
      languageVersion: "0.4.4",
      source: "library LinkedList { uint80 constant None = uint80(0);  struct data { uint256 head;  Node[100] n;  uint size; uint insert_number; uint buffer_size; } struct Node { string data;  address owner;  uint own;  uint prev; uint next;  } function construct_me(data storage self){  self.n[0].own = 0; self.n[0].next = 0; self.n[0].prev = 0; self.head = 0; self.insert_number = self.size = 1;  self.buffer_size = 100; }}contract owned {  address public owner; function owned() { owner = msg.sender; } function ownerOnly() { if (msg.sender != owner) throw; } modifier onlyOwner { if (msg.sender != owner) throw; _; } function transferOwnership(address newOwner) onlyOwner { owner = newOwner; }}contract Array is owned { using LinkedList for LinkedList.data; using LinkedList for LinkedList.Node; LinkedList.data list; function Array(){  if( test_callstack() != 1 ) throw;  list.construct_me(); } function test_callstack() constant returns ( int ){ return 1; }}",
      userDoc: {
        methods: {}
      }
    }
  },
  owned: {
    code: "0x6060604052600080546c0100000000000000000000000033810204600160a060020a031990911617905560db806100366000396000f3606060405260e060020a6000350463896f40dd811460305780638da5cb5b14604f578063f2fde38b146064575b6002565b34600257608660005433600160a060020a0390811691161460a4576002565b346002576088600054600160a060020a031681565b34600257608660043560005433600160a060020a0390811691161460a6576002565b005b60408051600160a060020a039092168252519081900360200190f35b565b600080546c010000000000000000000000008084020473ffffffffffffffffffffffffffffffffffffffff199091161790555056",
    info: {
      abiDefinition: [{...}, {...}, {...}, {...}],
      compilerOptions: "--combined-json bin,abi,userdoc,devdoc --add-std --optimize",
      compilerVersion: "0.4.4",
      developerDoc: {
        methods: {}
      },
      language: "Solidity",
      languageVersion: "0.4.4",
      source: "library LinkedList { uint80 constant None = uint80(0);  struct data { uint256 head;  Node[100] n;  uint size; uint insert_number; uint buffer_size; } struct Node { string data;  address owner;  uint own;  uint prev; uint next;  } function construct_me(data storage self){  self.n[0].own = 0; self.n[0].next = 0; self.n[0].prev = 0; self.head = 0; self.insert_number = self.size = 1;  self.buffer_size = 100; }}contract owned {  address public owner; function owned() { owner = msg.sender; } function ownerOnly() { if (msg.sender != owner) throw; } modifier onlyOwner { if (msg.sender != owner) throw; _; } function transferOwnership(address newOwner) onlyOwner { owner = newOwner; }}contract Array is owned { using LinkedList for LinkedList.data; using LinkedList for LinkedList.Node; LinkedList.data list; function Array(){  if( test_callstack() != 1 ) throw;  list.construct_me(); } function test_callstack() constant returns ( int ){ return 1; }}",
      userDoc: {
        methods: {}
      }
    }
  }
}
