
    
    
    

function decodeMsgData(bytes calldata msgData) external pure returns (address to, uint value, address origSender) {
    
        
    (to, value, origSender) = abi.decode(msgData[4:],(address,uint,address));
}
