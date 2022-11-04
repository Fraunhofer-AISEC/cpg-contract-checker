Untitled:191:20: Error: Member "value" not found or not visible after argument-dependent lookup in function (address,uint256,uint8,address,bytes4,bytes memory,uint256,uint256,uint16,uint256,uint256) returns (contract FutureBlockCall) - did you forget the "payable" modifier?
        var call = (new FutureBlockCall).value(callConfig.endowment)(
                   ^-------------------------^
