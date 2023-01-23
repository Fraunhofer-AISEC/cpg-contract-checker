pragma solidity 0.4.24;

contract Test {

    mapping (address => uint[]) cardsOwned;
    mapping (address => mapping (uint => uint)) cardsCounter;

    function cardsOwnedBy(address _owner) view public returns (uint[]) {
        return (cardsOwned[_owner]);
    }

    function cardsCounterFor(address _owner, uint _id) view public returns (uint) {
        return cardsCounter[_owner][_id];
    }

}
