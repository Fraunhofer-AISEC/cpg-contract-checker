
pragma solidity =0.6.12;

contract Test {

string public constant name = "Your Contract name";    

constructor() public {
uint chainId;
assembly {
        chainId := chainid()
    }
bytes32 DOMAIN_SEPARATOR;
DOMAIN_SEPARATOR = keccak256(
    abi.encode(
        keccak256('EIP712Domain(string name,string version,uint256 chainId,address verifyingContract)'),
        keccak256(bytes(name)),
        keccak256(bytes('1')),
        chainId,
        address(this)
    )
);}}
