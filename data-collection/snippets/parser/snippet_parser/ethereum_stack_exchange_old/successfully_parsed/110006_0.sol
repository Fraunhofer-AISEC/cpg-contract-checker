pragma solidity ^0.5.1;
contract stacktest{
    function stackdeep(address v1, uint v2, uint v3, uint v4, uint v5, uint v6, uint v7, uint v8) public view returns(uint[8] memory){
        uint v9=0;
        uint[8] memory args;
        uint v10=v8;
        uint v11 =v8;
        uint v12=v5;
        uint v13=v5;
        args[1]=v13;
        args[2]=v12;
        args[3]=v3;
        args[4]=v6;
        args[5]=v7;
        args[6]=v10;
        args[7]=v11;
        bytes memory v14=abi.encodePacked(v13);
        bytes32 v15=keccak256(v14);
        args[0]=uint(v1); 
        return(args);
    }
}
