pragma solidity ^0.4.4;
contract TestContract {
    struct Item {
        uint someUint;
        Item[] internalItems;
    }
    Item[] items;
    function TestContract() {}
    function test() {
        Item memory item;
        items.push(item);
    }
}
