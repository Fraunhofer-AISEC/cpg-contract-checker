Invalid implicit conversion from address to address payable requested.

pragma solidity >=0.4.22 <0.6.0;

    contract owned{
        address owner;
        constructor() public{
            owner = msg.sender;
        }
        modifier onlyOwner{
            require(owner == msg.sender);
            _;
        }
    }
    contract mortal is owned{
        function close()public onlyOwner{
            selfdestruct(owner);
        }

}
