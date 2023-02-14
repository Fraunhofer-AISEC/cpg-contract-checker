pragma solidity ^0.8.0;

contract MyContract{
    uint8[][][] public cube;

    constructor(){
        for(uint8 i = 0; i < 10; i++){
            for(uint8 j = 0; j < 10; j++){
                for(uint8 k = 0; k < 10; k++){ 
                    cube[i][j][k] = i + j + k;
                }
            }
        }
    }
}
