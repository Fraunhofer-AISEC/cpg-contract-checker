
pragma solidity ^0.8.9;

import "./MockERC721OffchainPermit.sol";

interface IHevm {
    function sign(uint256 sk, bytes32 digest)
        external
        returns (
            uint8 v,
            bytes32 r,
            bytes32 s
        );
}

contract EchidnaERC721OffchainPermit {
    MockERC721OffchainPermit asset;
    IHevm hevm;
    uint256 constant OWNER_PK = 2;
    
    address constant OWNER = 0x2B5AD5c4795c026514f8317c7a215E218DcCD6cF;

    event AssertionFailed(string reason);
    event EchidnaSaveTransferInfo(
        address from,
        address to,
        uint256 tokenId,
        uint256 deadline,
        uint256 blockTimestamp
    );
    event EchidnaLogEvent(string reason);
    event EchidnaDigestCreated(bytes32 digest);
    event EchidnaDigestSigned(uint8 v, bytes32 r, bytes32 s);
    event EchidnaSignatureGenerated(bytes signature);

    constructor() {
        asset = new MockERC721OffchainPermit();
        
        
        
        hevm = IHevm(0x7109709ECfa91a80626fF3989D68f67F5b1DD12D);
    }

    
    function createSignature(
        address spender,
        uint256 tokenId,
        uint256 deadline
    ) public returns (bytes memory) {
        require(spender != address(0), "Spender cannot be zero address");
        require(deadline >= block.timestamp, "Deadline must be higher than current timestamp");
        require(asset.getNonce(tokenId) >= 0, "Token must be already minted");
        uint256 _nonce = asset.getNonce(tokenId);
        bytes32 _digest = asset._buildDigest(spender, tokenId, _nonce, deadline);
        emit EchidnaDigestCreated(_digest);
        (uint8 v, bytes32 r, bytes32 s) = hevm.sign(OWNER_PK, _digest);
        emit EchidnaDigestSigned(v, r, s);
        emit EchidnaSignatureGenerated(abi.encodePacked(r, s, v));
        return abi.encodePacked(r, s, v);
    }

    function testPermitToApprove(uint256 deadline) public {
        
        require(deadline > block.timestamp);
        
        
        asset.mint();
        
        uint256 tokenId = asset.getTokenCounter() - 1;
        
        asset.transferFrom(address(this), OWNER, tokenId);
        require(asset.ownerOf(tokenId) == OWNER, "Transfer failed");
        
        bytes memory signature = createSignature(address(this), tokenId, deadline);
        
        
        emit EchidnaLogEvent(">>> TEST 1 <<<");
        bool permitAndTransferSuccessful = false;
        emit EchidnaSaveTransferInfo(OWNER, address(this), tokenId, deadline, block.timestamp);

        try
            asset.safeTransferFromAndPermit(OWNER, address(this), tokenId, "", deadline, signature)
        {
            permitAndTransferSuccessful = true;
            emit EchidnaLogEvent(">>> TEST 1 SUCCESFULL <<<");
        } catch {
            emit AssertionFailed(">>> TEST 1 FAILED <<<");
        }
        
        emit EchidnaLogEvent(">>> TEST 2 <<<");
        if (permitAndTransferSuccessful) {
            try
                asset.safeTransferFromAndPermit(
                    OWNER,
                    address(this),
                    tokenId,
                    "",
                    deadline,
                    signature
                )
            {
                emit AssertionFailed(">>> TEST 2 FAILED <<<");
            } catch {
                emit EchidnaLogEvent(">>> TEST 2 SUCCESFULL <<<");
            }
        }
    }

    
    function onERC721Received(
        address operator,
        address from,
        uint256 tokenId,
        bytes calldata data
    ) external returns (bytes4) {
        return IERC721Receiver.onERC721Received.selector;
    }
}

