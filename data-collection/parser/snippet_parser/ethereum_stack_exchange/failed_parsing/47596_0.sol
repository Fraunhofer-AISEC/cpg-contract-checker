contract B { 
     
     
     mapping (address => (address => bool)) permissionGiven;
     mapping (address => uint) ethBalance; 
     mapping (address => uint) balances; 

     function () payable { 
        ethBalance[msg.sender] = ethBalance[msg.sender].add(msg.value); 
     }

     function givePermission (address _a) public { 
        permissionGiven[msg.sender][a] = true;
     }

     function swap(address _a, address _c) public {
        if (permissionGiven[_c][_a] && permissionGiven[_a][_c]) {
           _c.transfer(ethBalance[_a]);
           transfer(_a, balances[_c]);
        }
     }

     function transfer (address _to, uint _tokens) {
         
     }
} 
