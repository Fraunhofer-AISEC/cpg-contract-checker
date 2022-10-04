function foo(address[] add, int value) public {

    for (int i = 0; i <= add.length; i++){
        add[i].transfer(value);
    }
}
