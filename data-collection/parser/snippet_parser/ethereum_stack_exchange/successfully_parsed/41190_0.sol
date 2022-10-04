contract HelloWorld {
    function sayHello() public pure returns (string) {
        return ("Hello World!");
    }

    function kill()  public {
        selfdestruct(address(this));
    }
}
