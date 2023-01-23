pragma solidity ^0.4.16;

contract Owned {
        address public owner;

        function owned() {
            owner = msg.sender;
        }

        modifier onlyOwner {
            require(msg.sender == owner);
            _;
        }

        function transferOwnership(address newOwner) onlyOwner {
            owner = newOwner;
        }        
}



contract BatchToken is Owned {
    mapping (address => uint256) public balanceOf;      

    event Transfer(address indexed from, address indexed to, uint256 value);


    function distributeToken(address[] addresses, uint256 _value) onlyOwner {
        for (uint i = 0; i < addresses.length; i++) {
            balanceOf[owner] -= _value;
            balanceOf[addresses[i]] += _value;
            Transfer(owner, addresses[i], _value);
        } 
    }

    function Destroy() onlyOwner() {
        selfdestruct(owner);
    }
}
