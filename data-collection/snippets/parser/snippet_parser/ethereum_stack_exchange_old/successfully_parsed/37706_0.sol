contract MyContract {
    struct MyStruct {
        address a;
        uint b;
    }

    MyStruct[] public MyStructs;

    function getStruct(uint index) public constant returns (address, uint) {
        return (MyStructs[index].a, MyStructs[index].b);
    }

    function addStruct(address _a, uint _b) public returns (uint){
        MyStruct memory a = MyStruct(_a, _b);
        MyStructs.length++;
        MyStructs.push(a);
        return MyStructs.length;
    }
}
