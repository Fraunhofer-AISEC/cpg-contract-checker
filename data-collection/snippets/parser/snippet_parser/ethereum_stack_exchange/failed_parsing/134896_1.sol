function RandomlyAssigned(uint256 amount,uint256 num) { **No more error on this Line**
        for (uint256 a = 1; a <= num; a++) {  
            mint(msg.sender, amount);  
        }
}   
