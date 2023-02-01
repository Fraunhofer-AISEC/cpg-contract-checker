function addStruct(address _a, uint _b) public returns (uint){
    MyStruct memory a = MyStruct(_a, _b);
    MyStructs.push(a);
    
    return MyStructs.length;
}
