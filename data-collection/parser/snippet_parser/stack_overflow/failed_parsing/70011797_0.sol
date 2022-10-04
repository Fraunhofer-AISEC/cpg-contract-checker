pragma solidity ^0.8.0;

contract Nested {

    struct Parent {
        string parentPropertyA;
        mapping(uint=>Child) childProperty;
    }

    struct Child {
       string childPropertyA;
    }

    mapping(uint=>Parent) parents;

    function getParent(uint parentId) public view returns (Parent memory) {
        Parent memory parent = parents[parentId];
        return parent;
    }
}   

TypeError: Types containing (nested) mappings can only be parameters or return variables of internal or library functions.
