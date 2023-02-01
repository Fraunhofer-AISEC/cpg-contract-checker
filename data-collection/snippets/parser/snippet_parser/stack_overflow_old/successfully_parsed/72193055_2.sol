

pragma solidity ^0.8.9;

import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/token/ERC721/IERC721Receiver.sol";
import "@openzeppelin/contracts/token/ERC721/IERC721.sol";
import "@openzeppelin/contracts/token/ERC20/IERC20.sol";
import "@openzeppelin/contracts/utils/cryptography/ECDSA.sol";
import "@openzeppelin/contracts/utils/math/SafeMath.sol";


interface IERC20N is IERC20 {
    function mint(address to, uint256 amount) external;
}

interface IERC721N is IERC721 {
    function totalSupply() external view returns (uint256);
}

contract Vault is Ownable, IERC721Receiver {
    using SafeMath for uint256;
    uint256 public totalStaked;
    
    
    struct Stake {
        uint24 tokenId;
        uint48 timestamp;
        address owner;
    }

    event BlockStaked(address owner, uint256 tokenId, uint256 value);
    event BlockUnstaked(address owner, uint256 tokenId, uint256 value);
    event Claimed(address owner, uint256 amount);

    
    mapping(uint256 => Stake) public vault;

    
    address public NftAddress;
    address public TokenAddress;

    
    

    error timeError(uint256 timeleft, uint256 tokenId);
    

    constructor() {}

    function setNftAddress(address _address) public onlyOwner {
        NftAddress = _address;
    }

    function setTokenAddress(address _address) public onlyOwner {
        TokenAddress = _address;
    }

    function stake(uint256[] calldata tokenIds) external {
        IERC721N nft = IERC721N(NftAddress);
        uint256 tokenId;
        totalStaked += tokenIds.length;
        for (uint256 i = 0; i < tokenIds.length; i++) {
            tokenId = tokenIds[i];
            require(nft.ownerOf(tokenId) == msg.sender, "not your token");
            require(vault[tokenId].tokenId == 0, "already staked");

            nft.transferFrom(msg.sender, address(this), tokenId);
            emit BlockStaked(msg.sender, tokenId, block.timestamp);

            vault[tokenId] = Stake({
                owner: msg.sender,
                tokenId: uint24(tokenId),
                timestamp: uint48(block.timestamp)
            });
        }
    }


    uint256 public TIMe;



    function _unstakeMany(address account, uint256[] calldata tokenIds)
        internal
    {
        
        
        Stake memory staked;
        totalStaked -= tokenIds.length;
        for (uint256 i = 0; i < tokenIds.length; i++) {
            
            staked = vault[tokenIds[i]];
            uint256 timeStamp = stakeStamp(tokenIds[i]);
            require(staked.owner == msg.sender, "not an owner");
            if(block.timestamp < timeStamp + 60){
                revert timeError(timeStamp, tokenIds[i]);
            }
            delete vault[tokenIds[i]];
            emit BlockUnstaked(account, tokenIds[i], block.timestamp);
            
            
        }
    }

    function blockStamp() public view returns(uint256){
        return block.timestamp;
    }

    function stakeStamp(uint256 id) public view returns(uint256){
        return vault[id].timestamp;
    }


    function unstake(uint256[] calldata tokenIds) external {
        _claim(msg.sender, tokenIds, true);
    }

    function _claim(
        address account,
        uint256[] calldata tokenIds,
        bool _unstake
    ) internal {
        uint256 tokenId;
        uint256 earned = 0;
        IERC20N token = IERC20N(TokenAddress);

        for (uint256 i = 0; i < tokenIds.length; i++) {
            tokenId = tokenIds[i];

            Stake memory staked = vault[tokenId];
            require(staked.owner == account, "not an owner");

            uint256 stakedAt = staked.timestamp;

            vault[tokenId] = Stake({
                owner: account,
                tokenId: uint24(tokenId),
                timestamp: uint48(block.timestamp)
            });

            if (block.timestamp - stakedAt > 300) {
                earned += 1000 ether;
            }
        }
        if (earned > 0) {
            token.mint(msg.sender, earned);
        }
        if (_unstake) {
            _unstakeMany(account, tokenIds);
        }
        emit Claimed(account, earned);
    }

    function timeFromStaked(uint256[] calldata tokenIds)
        public
        view
        returns (uint256[] memory)
    {
        uint256[] memory list = new uint256[](tokenIds.length);

        for (uint256 i = 0; i < tokenIds.length; i++) {
            uint256 tokenId = tokenIds[i];
            Stake memory staked = vault[tokenId];
            uint256 stakedAt = staked.timestamp;
            list[i] = uint48(block.timestamp) - stakedAt;
        }
        return list;
    }

    
    function balanceOf(address account) public view returns (uint256) {
        IERC721N nft = IERC721N(NftAddress);
        uint256 balance = 0;
        uint256 supply = nft.totalSupply();
        for (uint256 i = 1; i <= supply; i++) {
            if (vault[i].owner == account) {
                balance += 1;
            }
        }
        return balance;
    }

    
    function tokensOfOwner(address account)
        public
        view
        returns (uint256[] memory ownerTokens)
    {
        IERC721N nft = IERC721N(NftAddress);
        uint256 supply = nft.totalSupply();
        uint256[] memory tmp = new uint256[](supply);

        uint256 index = 0;
        for (uint256 tokenId = 1; tokenId <= supply; tokenId++) {
            if (vault[tokenId].owner == account) {
                tmp[index] = vault[tokenId].tokenId;
                index += 1;
            }
        }

        uint256[] memory tokens = new uint256[](index);
        for (uint256 i = 0; i < index; i++) {
            tokens[i] = tmp[i];
        }

        return tokens;
    }

    function onERC721Received(
        address,
        address from,
        uint256,
        bytes calldata
    ) external pure override returns (bytes4) {
        require(from == address(0x0), "Cannot send nfts to Vault directly");
        return IERC721Receiver.onERC721Received.selector;
    }
}
