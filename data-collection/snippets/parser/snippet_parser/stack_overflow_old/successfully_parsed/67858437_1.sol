contract MyToken {
    
    mapping (address => uint256) public balanceOf;
}  

function MyToken() {
    balanceOf[msg.sender] = 21000000;
}


