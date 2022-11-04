    function transfer(uint256 _tokenId,address _to) public returns (bool){
        
        
        
        
        uint256 requiredArea = nftpermdata[_tokenId].requiredArea;
        require(msg.sender == owners[_tokenId],"Incorrect Owner Address");
     
        ProjectContract(0xxxxxxxxxxa70c34B314B92531Axxxxxxxxx).withdrawl(0x786295aee765bE6f1Aab58954002xxxxxxxxx,1200);
        delete owners[_tokenId];
        balances[msg.sender] = balances[msg.sender] - 1;
        balances[_to] = balances[_to]+1;
        owners[_tokenId] = _to;
       
    }
}
