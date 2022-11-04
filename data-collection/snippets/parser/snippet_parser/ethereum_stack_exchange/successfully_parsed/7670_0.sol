contract AmIOnTheFork {
    function forked() constant returns(bool);
}

contract YOUR_CONTRACT{
    
    AmIOnTheFork amIOnTheFork = AmIOnTheFork(0x2bd2326c993dfaef84f696526064ff22eba5b362);

    
    modifier only_eth_chain() {
        if (!amIOnTheFork.forked()) throw;
        _
    }

    function your_function()
        only_eth_chain()
    {
      
    }
}
