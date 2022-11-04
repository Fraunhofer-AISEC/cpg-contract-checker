   function getParsed(bytes32 value, uint index) external pure returns (uint8 cleared){
     assembly {          
        let move := mul(index,4)
        let shifted := shr(move, value)    
        cleared := and(0x000000000000000000000000000000000000000000000000000000000000000f,shifted)       
    }
}
