contract ConcreteImplMock is ConreteImp {

    function getTimestamp() internal override returns(uint) {
        return 100;
    }
}
