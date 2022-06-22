

pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "./mintNFT.sol";

contract SaleNFT {

    MintNFT public mintNftTokenAddress;  
    IERC20 public currencyTokenAddress;
    uint256 feePercent;
    address payable feeAddress;
    address owner;
    
    constructor(address _mintNftTokenAddress, IERC20 _currencyTokenAddress, address payable _feeAddress, uint256 _feePercent) {
        mintNftTokenAddress = MintNFT(_mintNftTokenAddress);
        currencyTokenAddress = _currencyTokenAddress;        
        feeAddress = _feeAddress;
        feePercent = _feePercent;
        owner = msg.sender;
    }

    
    struct Trade {
        uint256 item;
        uint256 price;
    }

    
    modifier onlyOwner {
        require(msg.sender == owner, "Caller not owner");
        _;
    }

    
    mapping(uint256 => Trade) public trades;
    
    uint256[] public onSaleTokenArray;    

    function changeFee(uint256 _feePercent , address payable _feeAddress) onlyOwner external returns (bool) {
        feePercent = _feePercent;
        feeAddress = _feeAddress;
        return true;
    }

    function _pay(address from, address to, uint256 amount) internal returns (bool) {
        return IERC20(currencyTokenAddress).transferFrom(from, to, amount);
    }

    function setForSaleNft(uint256 _tokenId, uint256 _price) public {

        address tokenOwner = mintNftTokenAddress.ownerOf(_tokenId);

        require(tokenOwner == msg.sender, "Caller is not token owner.");
        require(_price > 0, "Price is zero or lower.");
        require(trades[_tokenId].price == 0, "This token is already on sale.");
        require(mintNftTokenAddress.isApprovedForAll(tokenOwner, address(this)), "token owner did not approve token.");

        trades[_tokenId] = Trade({
            item: _tokenId,
            price: _price
        });

        onSaleTokenArray.push(_tokenId);
    }
    
    function purchaseToken(uint256 _tokenId) external {

        uint256 price = trades[_tokenId].price;
        address tokenOwner = mintNftTokenAddress.ownerOf(_tokenId);
        uint256 balance = currencyTokenAddress.balanceOf(msg.sender);
        uint256 premium = price * feePercent / 10000;

        require(price > 0, "token not sale");
        require(tokenOwner != msg.sender, "Caller is token owner.");
        require((balance + premium) >= price, "Lack of balance"); 
        require(balance >= (premium + price), "Caller sent lower than price.");

        require(_pay(msg.sender, tokenOwner, price), "token transfer error for owner");      
        mintNftTokenAddress.safeTransferFrom(tokenOwner, msg.sender, _tokenId);

        require(_pay(msg.sender, feeAddress, premium), "token transfer error for feeaddress");        

        trades[_tokenId].price = 0;

        for(uint256 i = 0; i < onSaleTokenArray.length; i++) {
            if (trades[onSaleTokenArray[i]].price == 0) {
                if ((onSaleTokenArray.length - 1) > 0) {
                    onSaleTokenArray[i] = onSaleTokenArray[onSaleTokenArray.length - 1];
                }
                onSaleTokenArray.pop();
            }
        }
    }

    function getOnSaleTokenArrayLength() view public returns (uint256) {
        return onSaleTokenArray.length;
    }

    function getTokenPrice(uint256 _tokenId) view public returns (uint256) {
        return trades[_tokenId].price;
    }

    function getBalanceERC20() public view returns(uint256) {
        return IERC20(currencyTokenAddress).balanceOf(msg.sender);
    }
}
