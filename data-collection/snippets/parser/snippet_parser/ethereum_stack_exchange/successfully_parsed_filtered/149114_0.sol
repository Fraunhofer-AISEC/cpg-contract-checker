contract MyContract {
    event Called(bytes functionID);

    function foo() private m {
        
    }

    function bar() private m  {
        
    }

    modifier m {
        emit Called(   );
        _;
    }
}
