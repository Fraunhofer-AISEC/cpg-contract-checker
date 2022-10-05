pragma solidity ^0.4.0;
contract test {

struct user {
    string name;
    address add;
}

mapping (address => user) public userRegister;

 function add_user (string name, address addr)   {  
     userRegister[addr].name=name;  
      userRegister[addr].add=addr;  
}


function clearStruct (address addr)   {  
   delete userRegister[addr];  

}

function try_it (address addr)  returns (string name) {  

   return userRegister[addr].name ;
}
} 
