function getInvokeMessage(address sender, address recipient, uint128 amount, bool bounce, TvmCell payload) public pure
        returns(TvmCell message) {
        TvmCell body = tvm.encodeBody(MsigDebot.invokeTransaction, sender, recipient, amount, bounce, payload);
        TvmBuilder message_;
        message_.store(false, true, true, false, address(0), address(this));
        message_.storeTons(0);
        message_.storeUnsigned(0, 1);
        message_.storeTons(0);
        message_.storeTons(0);
        message_.store(uint64(0));
        message_.store(uint32(0));
        message_.storeUnsigned(0, 1); 
        message_.storeUnsigned(1, 1); 
        message_.store(body);
        message = message_.toCell();
    }
