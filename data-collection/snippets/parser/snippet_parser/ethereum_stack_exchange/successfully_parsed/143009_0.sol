   function _safeMint(
    address to,
    uint256 quantity,
    bytes memory _data
) internal virtual {
    _mint(to, quantity);

    unchecked {
        if (to.code.length != 0) {
            uint256 end = _currentIndex;
            uint256 index = end - quantity;
            do {
                if (!_checkContractOnERC721Received(address(0), to, index++, _data)) {
                    revert TransferToNonERC721ReceiverImplementer();
                }
            } while (index < end);
            
            if (_currentIndex != end) revert();
        }
    }
}


function _safeMint(address to, uint256 quantity) internal virtual {
    _safeMint(to, quantity, '');
}




   function mint(uint256 numberOfTokens) external payable
{
require(isPublicSaleActive, "Public sale is paused.");
require(totalSupply() + numberOfTokens < maxSupply + 1, "Maximum supply exceeded.");

require(numberOfTokens <= MAX_MINTS_PER_TX, "Maximum mints per transaction exceeded.");

if(freeNFTAlreadyMinted + numberOfTokens > NUM_FREE_MINTS)
{
    require(PUBLIC_SALE_PRICE * numberOfTokens <= msg.value, "Invalid ETH value sent. Error Code: 1");
} 
else 
{
    uint sender_balance = balanceOf(msg.sender);
    
    if (sender_balance + numberOfTokens > MAX_FREE_PER_WALLET) 
    { 
        if (sender_balance < MAX_FREE_PER_WALLET)
        {
            uint free_available = MAX_FREE_PER_WALLET - sender_balance;
            uint to_be_paid = numberOfTokens - free_available;
            require(PUBLIC_SALE_PRICE * to_be_paid <= msg.value, "Invalid ETH value sent. Error Code: 2");

            freeNFTAlreadyMinted += free_available;
        }
        else
        {
            require(PUBLIC_SALE_PRICE * numberOfTokens <= msg.value, "Invalid ETH value sent. Error Code: 3");
        }
    }  
    else 
    {
        require(numberOfTokens <= MAX_FREE_PER_WALLET, "Maximum mints per transaction exceeded");
        freeNFTAlreadyMinted += numberOfTokens;
    }
}

_safeMint(msg.sender, numberOfTokens);

 }
