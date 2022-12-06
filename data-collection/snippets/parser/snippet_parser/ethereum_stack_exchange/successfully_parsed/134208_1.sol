function widthdrawAmount() internal {
    
    (bool success,)= owner.call{value: 10}("");
    
    require(success,"tx failed");
}
