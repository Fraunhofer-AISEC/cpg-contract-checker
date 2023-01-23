
pragma solidity ^0.8.0;

contract SelfWhitelist {

    address[] public addressWhitelist;

    function whitelist() public returns(string memory) {
        for(uint i = 0; i < addressWhitelist.length; i++) {
            if(addressWhitelist[i] != msg.sender) {
                addressWhitelist.push(msg.sender);
                return "Whitelisted!";
            }
        }
        return "Already whitelisted!";
    }

    function check() public view returns (bool){
        for(uint i = 0; i < addressWhitelist.length; i++){
            if(addressWhitelist[i] == msg.sender)
                return true;
        }
        return false;
    }

}
