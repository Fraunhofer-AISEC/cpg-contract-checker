function stackdeep2(bytes memory data) public returns(uint[8] memory){
        uint v9=0;
        (address v1, uint v2, uint v3, uint v4, uint v5, uint v6, uint v7, uint v8)=abi.decode(data,(address,uint,uint,uint,uint,uint,uint,uint));
        uint[8] memory args;
        uint v10=v8;
        uint v11=v8;
        uint v12=v5;
        uint v13=v5;

        bytes memory v14=abi.encodePacked(v13);
        bytes32 v15=keccak256(v14);
        
        return(args);
    }
