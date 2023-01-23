pragma solidity ^0.5.8;

contract MappingInStruct {

    struct Parent {
        mapping(bytes32 => Child) childrenOfTheMapping;
        Child[] childrenOfTheArray;
    }

    struct Child {
        uint value;
        string name;
    }

    Parent[] parents;

    function newParent() public {
        Parent memory p;
        parents.push(p);
        
    }

    

    function newChildOfTheMapping(uint parent, bytes32 key, uint value, string memory name) public {
        Parent storage p = parents[parent]; 
        Child storage c = p.childrenOfTheMapping[key]; 
        c.value = value;
        c.name = name;
    }

    function getChildOfTheMapping(uint parent, bytes32 key) public view returns(uint value, string memory name) {
        Child storage c = parents[parent].childrenOfTheMapping[key];
        return (c.value, c.name);
    }

    

    function newChildOfTheArray(uint parent, uint value, string memory name) public {
        Child memory c = Child({
            value: value,
            name: name
        });
        Parent storage p = parents[parent];
        p.childrenOfTheArray.push(c);
    }

    function getChildOfTheArray(uint parent, uint child) public view returns(uint value, string memory name) {
        Child storage c = parents[parent].childrenOfTheArray[child];
        return (c.value, c.name);
    }

    
    function parentChildrenOfTheArrayCount(uint parent) public view returns(uint count) {
        count = parents[parent].childrenOfTheArray.length;
    }
}
