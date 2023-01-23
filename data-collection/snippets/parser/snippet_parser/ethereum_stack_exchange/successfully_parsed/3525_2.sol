contract Foo {
    mapping (bytes32 => Thing) things;

    struct Thing {
        Item[] items;
        uint _bar;
    }

    struct Item {
        uint number;
    }

    function Foo(bytes32 id, uint bar) {
        things[id]._bar = bar;
    }
}
