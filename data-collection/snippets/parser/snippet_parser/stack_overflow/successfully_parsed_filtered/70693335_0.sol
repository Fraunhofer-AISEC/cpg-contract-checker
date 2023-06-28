function mintAndPutOnMarketPlace(address payable mintingRecipient, string memory mintingUri, address marketOriginContract, uint256 marketSaleAmount, address marketplaceContractAddress)
        external
        payable
        returns (uint256)
    {
        address collection = marketOriginContract;
        address marketplace = marketplaceContractAddress;

        uint256 tokenId = delegateMint(collection, mintingRecipient, mintingUri);
        delegateApprove(collection, marketplaceContractAddress);
        delegatePutOnSale(marketplace, marketOriginContract, tokenId, marketSaleAmount);

        return tokenId;
    }

    function delegateMint(address collection, address recipient, string memory uri) internal returns(uint256 tokenId){

        ICollection icollection = ICollection(collection);
        tokenId = icollection.mint(payable(recipient),uri);

        return tokenId;
    }

    function delegateApprove(address collection, address operator) internal{

        bool toApprove = true;

        bytes memory payload = abi.encodeWithSignature("setApprovalForAll(address,bool)", operator, toApprove);

        bool success;

        assembly {
            let output := mload(0x40)
            success := delegatecall(
                gas(),
                collection,
                add(payload, 0x20),
                mload(payload),
                0,
                0
            )
        }

    }

    function delegatePutOnSale(address marketplace, address _originContract, uint256 _tokenId, uint256 _amount) internal{

        bytes memory payload = abi.encodeWithSignature("setSalePrice(address,uint256,uint256)",_originContract, _tokenId, _amount);

        bool success;

        assembly {
            let output := mload(0x40)
            success := delegatecall(
                gas(),
                marketplace,
                add(payload, 0x20),
                mload(payload),
                0,
                0
            )
        }

    }

