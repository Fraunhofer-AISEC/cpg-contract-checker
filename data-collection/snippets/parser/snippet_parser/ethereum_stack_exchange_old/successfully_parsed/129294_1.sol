contract Solution {
    struct MyStruct {
        uint var1;
        string var2;
        bool exists;

    }

    mapping(address => MyStruct) myMapping;


    function doesExist(address _check) public view returns(bool) {
        MyStruct memory obj = myMapping[_check];
        return obj.exists;
    }

    function addMapping(address _toAdd) public {
        MyStruct memory toAdd = MyStruct({
            var1: 1,
            var2: "hello world",
            exists: true
        });

        myMapping[_toAdd] = toAdd;

    }
}
