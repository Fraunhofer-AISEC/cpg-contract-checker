pragma solidity 0.5.11;

contract StorageCostTest {

    struct MyStruct {
        bool foo;
        uint256 bar;
        uint256 baz;
        address qux;
    }

    mapping(uint256 => MyStruct) private myStructs;
    uint256 public nextMyStructId;

    constructor() public {
        nextMyStructId = 1;
    }

    function addItem(bool foo, uint256 bar, uint256 baz, address qux) external {
        myStructs[nextMyStructId] = MyStruct({
           foo: foo,
           bar: bar,
           baz: baz,
           qux: qux
        });
        nextMyStructId += 1;
    }
}
