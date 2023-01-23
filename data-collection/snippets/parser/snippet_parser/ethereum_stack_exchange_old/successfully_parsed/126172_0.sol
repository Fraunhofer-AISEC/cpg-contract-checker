struct NFTVoucher {

uint256 tokenId;


uint256 minPrice;


string uri;


bytes signature;} 

function resell(address redeemer, NFTVoucher calldata voucher) public payable returns (uint256) {
address signer = _verify(voucher);
require(msg.value >= voucher.minPrice, "Insufficient funds to redeem");


_transfer(signer, redeemer, voucher.tokenId);


uint256 fee = msg.value / 10;
payable(signer).transfer(msg.value - fee);

return voucher.tokenId;}
