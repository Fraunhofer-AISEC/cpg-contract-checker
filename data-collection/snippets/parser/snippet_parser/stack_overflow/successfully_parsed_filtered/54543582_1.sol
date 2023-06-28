pragma solidity ^0.5.3;

contract C { 

    address[] addrList;

    function addAddr(address addr) public{
        addrList.push(addr);
    }

    function deleteAddr(address addr) public {

        for(uint256 i = 0; i < addrList.length; i++) {
             if(addr == addrList[i]) {
                 for(uint256 j = i; j < addrList.length-1; j++) {
                     addrList[j] = addrList[j + 1];
                 }
                 
                 addrList.length--;
             }
        }
    }

    function returnList() view public returns (address[] memory) {
        return addrList;
    }

}
