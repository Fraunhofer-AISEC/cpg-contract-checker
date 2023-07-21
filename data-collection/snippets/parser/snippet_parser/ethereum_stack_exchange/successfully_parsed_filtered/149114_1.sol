contract MyContract {
    event Called(bytes functionID);

    function foo() private m('foo') {
        
    }

    function bar() private m('bar')  {
        
    }

    modifier m(string func) {
        emit Called(func);
        _;
    }
}
