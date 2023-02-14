import "./ERC20.sol";

contract SmartContract1 {

 ERC20Basic private token;

 constructor () public {
    token = new ERC20Basic(10000);
    owner = msg.sender;
 }

 function Factory() public {
    address new_contract_address = address (new SmartContract2(msg.sender)); 
 }
}

contract SmartContract2 {

 address public owner;

 constructor (address _direccion) public {
    owner = _direccion;
 }

}
