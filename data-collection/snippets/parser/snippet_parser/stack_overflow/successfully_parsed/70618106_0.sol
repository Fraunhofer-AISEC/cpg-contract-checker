import "./myToken.sol" as erc20contract 

contract ERC721 is ERC721Interface, myToken {
    function transferFrom(address _from, address _to, uint256 _tokenId) public payable {

        address addr_owner = ownerOf(_tokenId);

        require(
            addr_owner == _from,
            "_from is NOT the owner of the token"
        );

        require(
            _to != address(0),
            "Transfer _to address 0x0"
        );

        address addr_allowed = allowance[_tokenId];
        bool isOp = operators[addr_owner][msg.sender];

        require(
            addr_owner == msg.sender || addr_allowed == msg.sender || isOp,
            "msg.sender does not have transferable token"
        );


        
        tokenOwners[_tokenId] = _to;
        balances[_from] = balances[_from].sub(1);
        balances[_to] = balances[_to].add(1);

        
        if (allowance[_tokenId] != address(0)) {
            delete allowance[_tokenId];
        }

        erc20contract.transferFrom(_to, nftInfo[_from].creator, 10); 
        {
        emit Transfer(_from, _to, _tokenId);
    }
}
}