
pragma solidity 0.8.13;

import "./Child.sol";


contract ChildFactory {
    uint256 id;
    mapping(uint256 => Child) childMapping;
    
    function createChild() public {
        Child child = new Child(address(this));
        child.transferOwnership(msg.sender);
        childMapping[id] = child;
        id++;
    }

    function depositEth(uint256 _id) public {
        childMapping[_id].depositEth();
    }

    function withdrawEth(uint256 _id) public {
        require(msg.sender == childMapping[_id].owner());
        childMapping[_id].factoryWithdrawEth(msg.sender);
    }
}

