
pragma solidity ^0.8.4;


import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/utils/Counters.sol";


contract EncryptionNFT is ERC721URIStorage {
    using Counters for Counters.Counter;
    Counters.Counter private tokenCounter;

    uint256 public fee_wei;
    bool public isLocked;               
    string private confirmationId;      
    string private sensitiveData;       
    address public encryptionService;   
    address public licensor;            
    uint256 public tokenID;             

    bool private isMutexed = false;             
    bool private isSensitiveDataSet = false;    

    event unlockPaid(address receiver, uint256 amount);
    event withdrawlMade(address receiver, uint256 amount);

    constructor(string memory name, uint256 _fee_gwei, string memory _confirmationId, address _encryption_service, address _licensor)
        ERC721(name, "DataX")
    {
        fee_wei = _fee_gwei * 1000000000;           
        isLocked = true;                            
        confirmationId = _confirmationId;           
        encryptionService = _encryption_service;    
        licensor = _licensor;                       

        tokenID = tokenCounter.current();           
        _safeMint(msg.sender, tokenID);
        tokenCounter.increment();
    }

    function unlock() public payable {
        require(isLocked == true, "Contract already unlocked.");
        require(msg.value >= fee_wei, "Not enough WEI to unlock NFT.");
        require(isMutexed == false, "Reentrant call detected!");
        isMutexed = true;

        
        uint256 rcv_payment = msg.value;
        uint256 licensor_cut = rcv_payment / 10;
        uint256 encryptor_cut = rcv_payment - licensor_cut;

        (bool is_encryptor_success, ) = payable(encryptionService).call{value: encryptor_cut}("");
        require(is_encryptor_success, "Encryptor transfer failed.");
        emit unlockPaid(encryptionService, encryptor_cut);

        (bool is_licensor_success, ) = payable(licensor).call{value: licensor_cut}("");
        require(is_licensor_success, "Licensor transfer failed.");
        emit unlockPaid(licensor, licensor_cut);

        isLocked = false;
        isMutexed = false;
    }

    function withdraw() public payable {
        require(msg.sender == ownerOf(tokenID), "Only owner may withdraw.");
        require(isLocked == false, "Contract must be unlocked.");
        require(isMutexed == false, "Reentrant call detected!");
        isMutexed = true;

        
        uint256 rcv_payment = msg.value;
        uint256 nft_service_cut = rcv_payment / 10;
        uint256 licensor_cut = nft_service_cut / 10;
        uint256 encryptor_cut = rcv_payment - licensor_cut;
        uint256 nft_owner_cut = rcv_payment - nft_service_cut;

        (bool is_encryptor_success, ) = payable(encryptionService).call{value: encryptor_cut}("");
        require(is_encryptor_success, "Encryptor transfer failed.");
        emit withdrawlMade(encryptionService, encryptor_cut);

        (bool is_licensor_success, ) = payable(licensor).call{value: licensor_cut}("");
        require(is_licensor_success, "Licensor transfer failed.");
        emit withdrawlMade(licensor, licensor_cut);

        (bool is_nft_owner_success, ) = payable(ownerOf(tokenID)).call{value: nft_owner_cut}("");
        require(is_nft_owner_success, "NFT Owner transfer failed.");
        emit withdrawlMade(ownerOf(tokenID), nft_owner_cut);

        isMutexed = false;
  }

    function setTokenURI(string memory _tokenURI) public {
        require(_isApprovedOrOwner(_msgSender(), tokenID), "ERC721: transfer caller is not owner nor approved.");
        _setTokenURI(tokenID, _tokenURI);
    }

    
    function setSensitiveData(string memory _confirmationId, string memory _sensitiveData) public {
        require(keccak256(bytes(_confirmationId)) == keccak256(bytes(confirmationId)), "Confirmation ID does not match.");
        require(isSensitiveDataSet == false, "Sensitive Data has already been set");
        sensitiveData = _sensitiveData;
        isSensitiveDataSet = true;
    }

    function getSensitiveData() public view returns (string memory){
        require(isSensitiveDataSet == true, "Sensitive Data must be set first.");
        require(msg.sender == encryptionService, "Only encryption service accessible.");
        return sensitiveData;
    }
}
