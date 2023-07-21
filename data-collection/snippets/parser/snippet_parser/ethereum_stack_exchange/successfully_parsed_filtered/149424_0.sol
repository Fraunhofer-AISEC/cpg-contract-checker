uint[2] memory royalty = royaltyInfo(_tokenId, price);

payable(royalty[0]).transfer(royalty[1]);
