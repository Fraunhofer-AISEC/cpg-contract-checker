contract TimeHelpersLock is TimeHelpers {

    function getTimestamp() internal override returns(uint) {
       return 100;
    }
}

contract ConcreteImplMock is ConcreteImpl, TimeHelpersMock {
    
    
}
