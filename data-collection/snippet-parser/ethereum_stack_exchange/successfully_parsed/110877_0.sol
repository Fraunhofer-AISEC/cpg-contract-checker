IERC20  LINK;


constructor(address token,address _trustedForwarder) public {
         LINK = IERC20(token);
         trustedForwarder = _trustedForwarder;
}


 function approvetip(uint256 amount_) public {
    
   
        LINK.approve( trustedForwarder, amount_);
}



function transfertip(address to_, uint256 amount_) public {
    
    LINK.transferFrom(_msgSender(),to_, amount_);
}

function versionRecipient() external view override returns (string memory) {
    return "1";
}
