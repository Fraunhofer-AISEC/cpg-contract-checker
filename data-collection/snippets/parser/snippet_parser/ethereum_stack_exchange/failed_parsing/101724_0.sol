MyStruct {
    string a;
    string b;
}

function f() public returns (MyStruct[] memory) {
    MyStruct[] memory a;
    
    MyStruct s1 = MyStruct("s1a", "s1b");
    MyStruct s2 = MyStruct("s2a", "s2b");

    a[0] = s1;
    a[1] = s2;
    
    return a;
}
