
pragma solidity ^0.8.0;

import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/v4.8.2/contracts/token/ERC721/ERC721.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/utils/math/SafeMath.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/v4.8.2/contracts/token/ERC20/IERC20.sol";

contract TestNFT is ERC721 {
    using SafeMath for uint256;
    address public owner;
    string public _tokenURI;
    uint256 private _tokenIdTracker;
    uint256 private maxSupply = 10000;
    uint8 public decimal;
    address payable[] private recipients;
    uint[] private percentages;

    
    mapping(address => bool) private nftHolders;

    
    uint256 private mintFee;

    
    uint256 private royaltyFee;

    
    event RecipientsUpdated(address payable[] recipients, uint[] percentages);

    
    event NftWithburnt(address currentOwner, uint256 tokenId);
    event NftWithdrawn(
        address indexed recipient,
        uint256 tokenId,
        address indexed nftContract
    );
    event NftMinted(address indexed recipient, uint256 nftAmount);

    
    event Deposit(address indexed sender, uint256 amount);
    event Forwarded(uint256 totalAmount, uint256[] amounts);

    constructor() ERC721("Project", "X") {
        decimal = 0;
        owner = payable(msg.sender);
        mintFee = 0.01 ether;
        royaltyFee = 5; 
        recipients.push(payable(0x22AbA4c94E703e280A96713c26a1c1872AB45D9e)); 
        percentages.push(20);
        recipients.push(payable(0xCAeaA9D2DffF37c240bafC215608752c9C125B42)); 
        percentages.push(5);
        recipients.push(payable(0xe1C87F43c12a7B43Bee853e66F0BCB3dd75d9E95)); 
        percentages.push(55);
        recipients.push(payable(0x38d5a7EF9DB64D05A47c82C5E42bB45A7C82B457));
        percentages.push(20);
        require(
            percentages.length == recipients.length,
            "Recipients and percentages length mismatch"
        );
        require(
            percentages.length <= 4,
            "Cannot specify more than 4 recipients"
        );
        uint totalPercentage;
        for (uint i = 0; i < recipients.length; i++) {
            require(
                recipients[i] != address(0),
                "Recipient address cannot be zero"
            );
            require(percentages[i] > 0, "Percentage must be greater than zero");
            totalPercentage += percentages[i];
        }
        require(totalPercentage == 100, "Percentages must add up to 100");
    }

    
    modifier onlyOwner() {
        require(
            msg.sender == owner,
            "Only the contract owner can call this function."
        );
        _;
    }

    
    function totalSupply() public view returns (uint256) {
        return _tokenIdTracker;
    }

    
    function getMaxSupply() public view returns (uint256) {
        return maxSupply;
    }

    
    function _baseURI() internal view override returns (string memory) {
        return _tokenURI;
    }

    
    function setTokenURI(string memory tokenURI) public onlyOwner {
        _tokenURI = tokenURI;
    }

    
    function updateRoyaltyFee(uint256 newRoyaltyFee) external onlyOwner {
        require(newRoyaltyFee <= 10); 
        royaltyFee = newRoyaltyFee;
    }

    function UpdateMintFee(uint256 newMintFee) external onlyOwner {
        mintFee = newMintFee;
    }

    function getMintFee() public view returns (uint256) {
        return mintFee;
    }

    
    function updateMaxSupply(uint256 newMaxSupply) external onlyOwner {
        maxSupply = newMaxSupply;
    }

    
    function getETHBalance() public view returns (uint256) {
        return address(this).balance;
    }

    function getStakingAddress() public view returns (address payable) {
        require(recipients.length >= 0, "Recipient does not exist");
        return recipients[0];
    }

    function getCharityAddress() public view returns (address payable) {
        require(recipients.length >= 1, "Recipient does not exist");
        return recipients[1];
    }

    function getMarketingAddress() public view returns (address payable) {
        require(recipients.length >= 2, "Recipient does not exist");
        return recipients[2];
    }

    function getLiquidityAddress() public view returns (address payable) {
        require(recipients.length >= 3, "Recipient does not exist");
        return recipients[3];
    }

    
    receive() external payable {
        if (msg.value > 0) {
            distributeRoyalties();
        }
    }

    
    function deposit() public payable {
        require(
            msg.value > 0,
            "deposit(ETH): input an amount, zero deposit is not allowed. "
        );
        distributeRoyalties();
        emit Deposit(msg.sender, msg.value);
    }

    
    function distributeRoyalties() internal {
        require(
            msg.value > 0,
            "distributeRoyalties: amount is too low for distribution."
        );
        uint256 balance = address(this).balance;
        uint256[] memory amounts = new uint256[](recipients.length);
        for (uint i = 0; i < recipients.length; i++) {
            amounts[i] = (balance * percentages[i]) / 100;
            require(amounts[i] > 0, "Amount is too low");
            (bool sent, ) = recipients[i].call{value: amounts[i]}("");
            require(sent, "Failed to send Ether to recipient");
        }
        emit Forwarded(balance, amounts);
    }

    
    function mint(uint256 nftAmount) public payable {
        require(nftAmount > 0, "mint: zero nftAmount not allowed.");
        require(
            _tokenIdTracker.add(nftAmount) <= maxSupply,
            "mint: Minting have reached the MaxSupply."
        );

        
        uint256 fee = nftAmount.mul(mintFee); 

        
        if (msg.sender != owner) {
            require(msg.value >= fee, "mint: Incorrect mintFee amount");
            distributeRoyalties(); 
        }

        
        for (uint256 i = 0; i < nftAmount; i++) {
            uint256 tokenId = _tokenIdTracker;
            _safeMint(msg.sender, tokenId);
            _tokenIdTracker = _tokenIdTracker.add(1);
        }

        
        if (balanceOf(_msgSender()) > 0) {
            nftHolders[_msgSender()] = true;
        } else if (balanceOf(_msgSender()) == 0) {
            nftHolders[_msgSender()] = false;
        }
        
        if (msg.value > fee) {
            address payable sender = payable(msg.sender);
            sender.transfer(msg.value.sub(fee));
        }
        emit NftMinted(msg.sender, nftAmount);
    }

    
    function burn(uint256 tokenId) public {
        require(
            _isApprovedOrOwner(_msgSender(), tokenId),
            "burn: caller is not owner nor approved"
        );
        _burn(tokenId);
        _tokenIdTracker--;

        
        if (balanceOf(_msgSender()) == 0) {
            nftHolders[_msgSender()] = false;
        } else if (balanceOf(_msgSender()) > 0) {
            nftHolders[_msgSender()] = true;
        }
        emit NftWithburnt(_msgSender(), tokenId);
    }

    
    function transferFrom(
        address from,
        address to,
        uint256 tokenId
    ) public virtual override {
        require(
            _isApprovedOrOwner(_msgSender(), tokenId),
            "ERC721: caller is not token owner or approved"
        );
        _transfer(from, to, tokenId);
    }

    
    function safeTransferFrom(
        address from,
        address to,
        uint256 tokenId
    ) public virtual override {
        require(
            _isApprovedOrOwner(_msgSender(), tokenId),
            "ERC721: caller is not token owner or approved"
        );
        _transfer(from, to, tokenId);
    }

    
    function safeTransferFrom(
        address from,
        address to,
        uint256 tokenId,
        bytes memory data
    ) public virtual override {
        require(
            _isApprovedOrOwner(_msgSender(), tokenId),
            "ERC721: caller is not token owner or approved"
        );
        _safeTransfer(from, to, tokenId, data);
    }

    
    function _safeTransfer(
        address from,
        address to,
        uint256 tokenId,
        bytes memory data
    ) internal virtual override {
        _transfer(from, to, tokenId);
        if (data.length > 0) {
            require(
                _checkOnERC721Received(from, to, tokenId, data),
                "ERC721: transfer to non ERC721Receiver implementer"
            );
        }
    }

    
    function isContract(address account) internal view returns (bool) {
        uint256 size;
        assembly {
            size := extcodesize(account)
        }
        return size > 0;
    }

    
    function _checkOnERC721Received(
        address from,
        address to,
        uint256 tokenId,
        bytes memory data
    ) internal virtual override returns (bool) {
        if (isContract(to)) {
            try
                IERC721Receiver(to).onERC721Received(
                    _msgSender(),
                    from,
                    tokenId,
                    data
                )
            returns (bytes4 retval) {
                return retval == IERC721Receiver.onERC721Received.selector;
            } catch (bytes memory reason) {
                if (reason.length == 0) {
                    revert(
                        "ERC721: transfer to non ERC721Receiver implementer"
                    );
                } else {
                    
                    assembly {
                        revert(add(32, reason), mload(reason))
                    }
                }
            }
        } else {
            return true;
        }
    }

    
    function _transfer(
        address from,
        address to,
        uint256 tokenId
    ) internal virtual override {
        require(
            _isApprovedOrOwner(_msgSender(), tokenId),
            "_transfer(): caller is not owner nor approved"
        );
        require(
            ERC721.ownerOf(tokenId) == from,
            "_transfer(): transfer from incorrect owner"
        );
        require(
            to != address(0),
            "_transfer(): transfer to the zero address not allowed"
        );

        
        if (balanceOf(to) > 0) {
            nftHolders[to] = true;
        } else if (balanceOf(to) == 0) {
            nftHolders[to] = false;
        }

        
        if (balanceOf(from) == 0) {
            nftHolders[from] = false;
        } else if (balanceOf(from) > 0) {
            nftHolders[from] = true;
        }
        super._transfer(from, to, tokenId);
    }

    
    function totalHolders() public view returns (uint256) {
        uint256 count = 0;

        
        address[] memory keys = new address[](totalSupply());

        
        for (uint256 i = 0; i < totalSupply(); i++) {
            address holder = ownerOf(i);
            bool found = false;
            for (uint256 j = 0; j < keys.length; j++) {
                if (keys[j] == holder) {
                    found = true;
                    break;
                }
            }
            if (!found) {
                keys[count] = holder;
                count++;
            }
        }

        return count;
    }

    
    function distributeERC20(address tokenAddress) external onlyOwner {
        require(
            msg.sender == owner,
            "Only the owner can withdraw ERC20 tokens"
        );
        require(recipients.length > 0, "No recipients specified");
        require(
            percentages.length == recipients.length,
            "Recipients and percentages length mismatch"
        );
        require(
            percentages.length <= 4,
            "Cannot specify more than 4 recipients"
        );

        
        IERC20 token = IERC20(tokenAddress);

        uint256 tokenBalance = token.balanceOf(address(this));
        require(tokenBalance > 0, "Contract has no tokens to withdraw");

        uint256[] memory amounts = new uint256[](recipients.length);
        uint256 totalPercentage;

        for (uint i = 0; i < recipients.length; i++) {
            totalPercentage += percentages[i];
        }

        for (uint i = 0; i < recipients.length; i++) {
            amounts[i] = (tokenBalance * percentages[i]) / totalPercentage;
            require(amounts[i] > 0, "Amount is too low");
            token.transfer(recipients[i], amounts[i]);
        }
        emit Forwarded(tokenBalance, amounts);
    }

    
    function onERC721Received(
        address,
        address,
        uint256,
        bytes memory
    ) public virtual returns (bytes4) {
        return this.onERC721Received.selector;
    }

    
    function callDistribution() external payable onlyOwner {
        uint256 balance = address(this).balance;
        uint256[] memory amounts = new uint256[](recipients.length);
        for (uint i = 0; i < recipients.length; i++) {
            amounts[i] = (balance * percentages[i]) / 100;
            require(
                amounts[i] > 0,
                "callDistribution: amount is too low for distribution."
            );
            (bool sent, ) = recipients[i].call{value: amounts[i]}("");
            require(sent, "Failed to send Ether to recipient");
        }
        emit Forwarded(balance, amounts);
    }

    
    function rescueNft(
        address nftContract,
        uint256 tokenId
    ) external onlyOwner {
        require(_exists(tokenId), "ERC721Metadata: nonexistent token");
        require(
            ownerOf(tokenId) == address(this),
            "The NFT is not in this contract's balance"
        );
        IERC721(nftContract).safeTransferFrom(
            address(this),
            msg.sender,
            tokenId
        );
        emit NftWithdrawn(msg.sender, tokenId, nftContract);
    }
} ```
