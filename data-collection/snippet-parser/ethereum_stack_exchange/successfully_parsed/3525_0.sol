contract Foo {
    mapping (bytes32 => Thing) things;

    struct Thing {
        Item[] items;
    }

    struct Item {
        uint number;
    }

    function Foo(bytes32 id) {
        Thing memory thing = Thing(); 
        things[id] = thing;
    }
}
