contract A is interEnum {
    B b;

    function bEnum(SIDE num) external {
       b.bEnum(num);
    }
}
