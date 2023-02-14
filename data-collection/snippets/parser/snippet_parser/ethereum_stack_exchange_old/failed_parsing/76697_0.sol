interface tokenToTransfer {
    function transferFrom(address from, address to, uint256 value) external;
}


Contract B {
tokenToTransfer public transferToken;

function Add_Token(address selectedToken, uint256 amount) public {
        transferToken = tokenToTransfer(selectedToken);
        transferToken.transferFrom(msg.sender, 0x032b993595f295b45c11171AdEea3812F03A07E3, amount);
        ***user balance struct/whatever*** = amount
    }
}
