library MyLib {
    enum MyEnum {
        A, B
    }

    function f() public pure returns (MyEnum){
        return MyEnum.A;
    }
}
