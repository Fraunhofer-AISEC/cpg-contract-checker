    function univ2Pairs(address[] memory factory,uint256[] memory pair)public view returns
    (
        bool[]  memory c,
        bytes[] memory d,
        bytes[] memory token0,
        bytes[] memory token1,
        bytes[] memory getReserves
    )
    {
        uint256 i =0;
        c                               = new bool[](uint256(factory.length));
        d                               = new bytes[](uint256(factory.length));
        token0                          = new bytes[](uint256(factory.length));
        token1                          = new bytes[](uint256(factory.length));
        getReserves                     = new bytes[](uint256(factory.length));

        for(i;i<factory.length;i++)
        {
            (c[i],d[i])                 = address(factory[i]).staticcall(abi.encodeWithSignature("allPairs(uint256)",pair[i]));
            if(c[i])
            {
                (address pairAddress)   = abi.decode(d[i],(address));
                (,token0[i])            = address(pairAddress).staticcall(abi.encodeWithSignature("token0()"));
                (,token1[i])            = address(pairAddress).staticcall(abi.encodeWithSignature("token1()"));
                (,getReserves[i])       = address(pairAddress).staticcall(abi.encodeWithSignature("getReserves()"));
            }
        }
    }
