function getPrice(address _sender,uint256 _quantity) public view returns (uint256){
    uint256 _userFreeAmount = maxFree.sub(_numberMinted(_sender)); 
    if (_userFreeAmount<=0){ 
        return price.mul(_quantity);
    }else if(_quantity.sub(_userFreeAmount)<=0){
         return 0;
    }else{
        return price.mul(_quantity.sub(_userFreeAmount));
    }
}
