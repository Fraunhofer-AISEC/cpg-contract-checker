

pragma solidity ^0.8.0;


contract TestContract {
    struct MyStruct {
        string a;
        string b;
    }
    
    event FCalled(MyStruct[] _a);

    function f() public {
        MyStruct[] memory a = new MyStruct[](2);
        
        MyStruct memory s1 = MyStruct("s1a", "s1b");
        MyStruct memory s2 = MyStruct("s2a", "s2b");
    
        a[0] = s1;
        a[1] = s2;
        
        emit FCalled(a);
    }
}
