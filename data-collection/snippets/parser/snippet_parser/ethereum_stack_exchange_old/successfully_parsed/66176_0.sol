constructor(address lib) public payable {
    walletLibrary = lib; 
    walletLibrary.delegatecall(bytes4(keccak256("initWallet(address)")), msg.sender);
}


function () public payable {
    emit LogValue(301,msg.value);
    walletLibrary.delegatecall(msg.data);
}
