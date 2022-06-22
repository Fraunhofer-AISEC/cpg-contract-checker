root@ubuntu-s-2vcpu-4gb-lon1-01:/geth/mybc/geth# more AddressContract.sol
pragma solidity ^0.4.19;

contract AddressContract {
    string private myAddress;
    function getAddress() public returns (string) {
        return myAddress;
   }
}

root@ubuntu-s-2vcpu-4gb-lon1-01:/geth/mybc/geth# vi AddressContract.sol
root@ubuntu-s-2vcpu-4gb-lon1-01:/geth/mybc/geth# solcjs --bin 
AddressContract.sol
AddressContract.sol:5:1: Warning: Function state mutability can be 
restricted to view
function getAddress() public returns (string) {
^
Spanning multiple lines.

 root@ubuntu-s-2vcpu-4gb-lon1-01:/geth/mybc/geth#
