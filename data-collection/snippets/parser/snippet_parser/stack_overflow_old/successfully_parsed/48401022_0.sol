pragma solidity ^0.4.18;

contract CryptoTokensMarket {

    address owner;

    string public standard = 'CryptoTokens';
    string public name;
    string public symbol;
    uint8 public decimals;
    uint256 public totalSupply;

    uint public nextTokenIndexToAssign = 0;

    bool public allTokensAssigned = false;
    uint public tokensRemainingToAssign = 0;

    
    mapping (uint => address) public tokenIndexToAddress;

    
    mapping (address => uint256) public balanceOf;

    struct Offer {
        bool isForSale;
        uint tokenIndex;
        address seller;
        uint minValue;          
        address onlySellTo;     
    }

    struct Bid {
        bool hasBid;
        uint tokenIndex;
        address bidder;
        uint value;
    }

    
    mapping (uint => Offer) public tokensOfferedForSale;

    
    mapping (uint => Bid) public tokenBids;

    mapping (address => uint) public pendingWithdrawals;

    event Assign(address indexed to, uint256 tokenIndex);
    event Transfer(address indexed from, address indexed to, uint256 value);
    event TokenTransfer(address indexed from, address indexed to, uint256 tokenIndex);
    event TokenOffered(uint indexed tokenIndex, uint minValue, address indexed toAddress);
    event TokenBidEntered(uint indexed tokenIndex, uint value, address indexed fromAddress);
    event TokenBidWithdrawn(uint indexed tokenIndex, uint value, address indexed fromAddress);
    event TokenBought(uint indexed tokenIndex, uint value, address indexed fromAddress, address indexed toAddress);
    event TokenNoLongerForSale(uint indexed tokenIndex);

    
    function CryptoTokensMarket() payable {
        
        owner = msg.sender;
        totalSupply = 10000;                        
        tokensRemainingToAssign = totalSupply;
        name = "CRYPTOTokenS";                                   
        symbol = "Ͼ";                               
        decimals = 0;                                       
    }

    function setInitialOwner(address to, uint tokenIndex) {
        if (msg.sender != owner) revert();
        if (allTokensAssigned) revert();
        if (tokenIndex >= 10000) revert();
        if (tokenIndexToAddress[tokenIndex] != to) {
            if (tokenIndexToAddress[tokenIndex] != 0x0) {
                balanceOf[tokenIndexToAddress[tokenIndex]]--;
            } else {
                tokensRemainingToAssign--;
            }
            tokenIndexToAddress[tokenIndex] = to;
            balanceOf[to]++;
            Assign(to, tokenIndex);
        }
    }

    function setInitialOwners(address[] addresses, uint[] indices) {
        if (msg.sender != owner) revert();
        uint n = addresses.length;
        for (uint i = 0; i < n; i++) {
            setInitialOwner(addresses[i], indices[i]);
        }
    }

    function allInitialOwnersAssigned() {
        if (msg.sender != owner) revert();
        allTokensAssigned = true;
    }

    function getToken(uint tokenIndex) {
        if (!allTokensAssigned) revert();
        if (tokensRemainingToAssign == 0) revert();
        if (tokenIndexToAddress[tokenIndex] != 0x0) revert();
        if (tokenIndex >= 10000) revert();
        tokenIndexToAddress[tokenIndex] = msg.sender;
        balanceOf[msg.sender]++;
        tokensRemainingToAssign--;
        Assign(msg.sender, tokenIndex);
    }

    
    function transferToken(address to, uint tokenIndex) payable {
        if (!allTokensAssigned) revert();
        if (tokenIndexToAddress[tokenIndex] != msg.sender) revert();
        if (tokenIndex >= 10000) revert();
        if (tokensOfferedForSale[tokenIndex].isForSale) {
            tokenNoLongerForSale(tokenIndex);
        }
        tokenIndexToAddress[tokenIndex] = to;
        balanceOf[msg.sender]--;
        balanceOf[to]++;
        Transfer(msg.sender, to, 1);
        TokenTransfer(msg.sender, to, tokenIndex);
        
        
        Bid bid = tokenBids[tokenIndex];
        if (bid.bidder == to) {
            
            pendingWithdrawals[to] += bid.value;
            tokenBids[tokenIndex] = Bid(false, tokenIndex, 0x0, 0);
        }
    }

    function tokenNoLongerForSale(uint tokenIndex) {
        if (!allTokensAssigned) revert();
        if (tokenIndexToAddress[tokenIndex] != msg.sender) revert();
        if (tokenIndex >= 10000) revert();
        tokensOfferedForSale[tokenIndex] = Offer(false, tokenIndex, msg.sender, 0, 0x0);
        TokenNoLongerForSale(tokenIndex);
    }

    function offerTokenForSale(uint tokenIndex, uint minSalePriceInWei) {
        if (!allTokensAssigned) revert();
        if (tokenIndexToAddress[tokenIndex] != msg.sender) revert();
        if (tokenIndex >= 10000) revert();
        tokensOfferedForSale[tokenIndex] = Offer(true, tokenIndex, msg.sender, minSalePriceInWei, 0x0);
        TokenOffered(tokenIndex, minSalePriceInWei, 0x0);
    }

    function offerTokenForSaleToAddress(uint tokenIndex, uint minSalePriceInWei, address toAddress) {
        if (!allTokensAssigned) revert();
        if (tokenIndexToAddress[tokenIndex] != msg.sender) revert();
        if (tokenIndex >= 10000) revert();
        tokensOfferedForSale[tokenIndex] = Offer(true, tokenIndex, msg.sender, minSalePriceInWei, toAddress);
        TokenOffered(tokenIndex, minSalePriceInWei, toAddress);
    }

    function buyToken(uint tokenIndex) payable {
        if (!allTokensAssigned) revert();
        Offer offer = tokensOfferedForSale[tokenIndex];
        if (tokenIndex >= 10000) revert();
        if (!offer.isForSale) revert();                
        if (offer.onlySellTo != 0x0 && offer.onlySellTo != msg.sender) revert();  
        if (msg.value < offer.minValue) revert();      
        if (offer.seller != tokenIndexToAddress[tokenIndex]) revert(); 

        address seller = offer.seller;

        tokenIndexToAddress[tokenIndex] = msg.sender;
        balanceOf[seller]--;
        balanceOf[msg.sender]++;
        Transfer(seller, msg.sender, 1);

        tokenNoLongerForSale(tokenIndex);
        pendingWithdrawals[seller] += msg.value;
        TokenBought(tokenIndex, msg.value, seller, msg.sender);

        
        
        Bid bid = tokenBids[tokenIndex];
        if (bid.bidder == msg.sender) {
            
            pendingWithdrawals[msg.sender] += bid.value;
            tokenBids[tokenIndex] = Bid(false, tokenIndex, 0x0, 0);
        }
    }

    function withdraw() payable {
        if (!allTokensAssigned) revert();
        uint amount = pendingWithdrawals[msg.sender];
        
        
        pendingWithdrawals[msg.sender] = 0;
        msg.sender.transfer(amount);
    }

    function enterBidForToken(uint tokenIndex) payable {
        if (tokenIndex >= 10000) revert();
        if (!allTokensAssigned) revert();                
        if (tokenIndexToAddress[tokenIndex] == 0x0) revert();
        if (tokenIndexToAddress[tokenIndex] == msg.sender) revert();
        if (msg.value == 0) revert();
        Bid existing = tokenBids[tokenIndex];
        if (msg.value <= existing.value) revert();
        if (existing.value > 0) {
            
            pendingWithdrawals[existing.bidder] += existing.value;
        }
        tokenBids[tokenIndex] = Bid(true, tokenIndex, msg.sender, msg.value);
        TokenBidEntered(tokenIndex, msg.value, msg.sender);
    }

    function acceptBidForToken(uint tokenIndex, uint minPrice) {
        if (tokenIndex >= 10000) revert();
        if (!allTokensAssigned) revert();                
        if (tokenIndexToAddress[tokenIndex] != msg.sender) revert();
        address seller = msg.sender;
        Bid bid = tokenBids[tokenIndex];
        if (bid.value == 0) revert();
        if (bid.value < minPrice) revert();

        tokenIndexToAddress[tokenIndex] = bid.bidder;
        balanceOf[seller]--;
        balanceOf[bid.bidder]++;
        Transfer(seller, bid.bidder, 1);

        tokensOfferedForSale[tokenIndex] = Offer(false, tokenIndex, bid.bidder, 0, 0x0);
        uint amount = bid.value;
        tokenBids[tokenIndex] = Bid(false, tokenIndex, 0x0, 0);
        pendingWithdrawals[seller] += amount;
        TokenBought(tokenIndex, bid.value, seller, bid.bidder);
    }

    function withdrawBidForToken(uint tokenIndex) {
        if (tokenIndex >= 10000) revert();
        if (!allTokensAssigned) revert();                
        if (tokenIndexToAddress[tokenIndex] == 0x0) revert();
        if (tokenIndexToAddress[tokenIndex] == msg.sender) revert();
        Bid bid = tokenBids[tokenIndex];
        if (bid.bidder != msg.sender) revert();
        TokenBidWithdrawn(tokenIndex, bid.value, msg.sender);
        uint amount = bid.value;
        tokenBids[tokenIndex] = Bid(false, tokenIndex, 0x0, 0);
        
        msg.sender.transfer(amount);
    }

}
