
pragma solidity 0.8.15;

contract Example{
  mapping(address => UserAssets)  userAssets;
    
    struct Beneficiary {
        address account;
        uint8 allowedPercentage;
        uint256 totalAmount;
        uint256 claimedAmount;
    }

     struct UserAssets {
        ERC1155Asset[] erc1155Assets;
       }

     struct ERC1155Asset {
        address owner;
        address _contract;
        uint256 tokenId;
        uint256 totalAmount;
        uint256 totalRemainingAmount;
        uint8 totalPercentage;
        Beneficiary[] beneficiaries;
        uint256 remainingBeneficiaries;
    }

 function addERC1155Assets(
        address[] memory contracts,
        uint256[] memory tokenIds,
        uint256[] calldata totalAmount,
        address[][] calldata beneficiaryAddresses,
        uint8[][] calldata beneficiaryPercentages
    ) external  {
      
        for (uint i = 0; i < contracts.length; i++) {
            _addERC1155Single(
                contracts[i],
                tokenIds[i],
                totalAmount[i],
                beneficiaryAddresses[i],
                beneficiaryPercentages[i]
            );
        }
    }
    
     function _addERC1155Single(
        address _contract,
        uint256 tokenId,
        uint256 totalAmount,
        address[] calldata beneficiaryAddresses,
        uint8[] calldata beneficiaryPercentages
    ) internal  {
        
        uint8 totalPercentage;
        Beneficiary[] memory _beneficiaries = new Beneficiary[](
            beneficiaryAddresses.length
        );
        
         userAssets[msg.sender].erc1155Assets.push(
            ERC1155Asset(
                msg.sender,
                _contract,
                tokenId,
                totalAmount,
                totalAmount,
                totalPercentage,
                _beneficiaries,
                beneficiaryAddresses.length
            )
        ); 
    }
}
