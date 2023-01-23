

pragma solidity ^0.8.0;

import "https://github.com/OpenZeppelin/openzeppelin-contracts/contracts/token/ERC721/ERC721.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/contracts/token/ERC721/IERC721Receiver.sol";

contract escrowTrade is IERC721Receiver {

    enum TradeState {newTradeEscrow, initiatorAssetsDeposited, initiatorCancel, responderAssetsDeposited, cancelledBeforeTrade, tradeInitiated, tradeComplete}
    
    address payable public initiatorWalletAddress;
    TradeState public tradeState;

    constructor() {
        initiatorWalletAddress = payable(msg.sender);
        tradeState = TradeState.newTradeEscrow;        
    }

    function onERC721Received(address, address, uint256, bytes calldata) public pure override returns (bytes4) {
        return IERC721Receiver.onERC721Received.selector;
    }

    function transferTokenToContract(address _NFTAddress, uint256 _NFTTokenID) 
        public
        onlyInitiator
        inTradeState(TradeState.newTradeEscrow) 
    {   
        
        ERC721(_NFTAddress).approve(address(this), _NFTTokenID);
        ERC721(_NFTAddress).safeTransferFrom(msg.sender, address(this), _NFTTokenID);
    }

    modifier onlyInitiator() {
        require(msg.sender == initiatorWalletAddress);
        _;
    }

    modifier inTradeState(TradeState _state) {
        require(tradeState == _state);
        _;
    }

}
