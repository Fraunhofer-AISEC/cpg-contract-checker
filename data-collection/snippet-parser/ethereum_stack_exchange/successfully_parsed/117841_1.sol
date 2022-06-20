pragma solidity ^0.8.0;

import {IERC721} from "@openzeppelin/contracts/token/ERC721/IERC721.sol";
import {Vault} from "./Vault.sol";

contract Sale {

    

    address public vault;

    

    uint public saleNonce;

    

    mapping(uint => bool) public saleStatus;
    mapping(uint => SaleInfo) public nftSale;
    mapping(address => SaleInfo[]) public userSale;
    mapping(address => SaleInfo[]) public userPurchase;
    mapping(address => mapping(uint => bool)) public nftStatus;
    mapping(address => mapping(uint => uint)) public nftNonce;

    

    struct SaleInfo {

        address buyer;
        address seller;
        address nft;
        uint id;
        uint price;
        uint endTime;
        bool completed;

    }

    

    event NewListing(address _nft, uint _id, uint _price, uint _endTime);
    event SaleChanged(address _nft, uint _id, uint _price, uint _endTime);
    event SaleCanceled(address _nft, uint _id);
    event Purchase(address _nft, uint _id, uint _price);

    

    function createSingleSale(IERC721 _nft, uint _id, uint _price, uint _saleTime) external {
        nftSale[saleNonce] = SaleInfo({
            seller : address(0),
            buyer : msg.sender,
            nft : address(_nft),
            id : _id,
            price : _price,
            endTime : block.timestamp + _saleTime,
            completed : false
        });
        saleStatus[saleNonce] = true;
        userSale[msg.sender].push(nftSale[saleNonce]);
        nftStatus[address(_nft)][_id] = true;
        nftNonce[address(_nft)][_id] = saleNonce;
        _nft.transferFrom(msg.sender, vault, _id);
        emit NewListing(address(_nft), _id, _price, block.timestamp + _saleTime);
        saleNonce++;
    }

    function adjustSingleSale(address _nft, uint _id, uint _price, uint _saleTime) external {
        require(nftSale[nftNonce[address(_nft)][_id]].seller == msg.sender && !nftSale[nftNonce[address(_nft)][_id]].completed);
        nftSale[nftNonce[_nft][_id]] = SaleInfo({
            seller : msg.sender,
            buyer : address(0),
            nft : _nft,
            id : _id,
            price : _price,
            endTime : block.timestamp + _saleTime,
            completed : false
        });
        emit SaleChanged(_nft, _id, _price, block.timestamp + _saleTime);
    }

    function cancelSingleSale(IERC721 _nft, uint _id) external {
        require(nftSale[nftNonce[address(_nft)][_id]].seller == msg.sender && !nftSale[nftNonce[address(_nft)][_id]].completed);
        saleStatus[nftNonce[address(_nft)][_id]] = false;
        Vault(vault).sendToken(_nft, _id, msg.sender, vault);
        emit SaleCanceled(address(_nft), _id);
    }

    

    function createBatchSale(IERC721[] memory _nft, uint[] memory _id, uint[] memory _price, uint[] memory _saleTime) external {
        uint amount = _nft.length;
        for(uint i = 0; i < amount; i++) {
            nftSale[saleNonce] = SaleInfo({
                seller : msg.sender,
                buyer : address(0),
                nft : address(_nft[i]),
                id : _id[i],
                price : _price[i],
                endTime : block.timestamp + _saleTime[i],
                completed : false
            });
            saleStatus[saleNonce] = true;
            userSale[msg.sender].push(nftSale[saleNonce]);
            nftStatus[address(_nft[i])][_id[i]] = true;
            nftNonce[address(_nft[i])][_id[i]] = saleNonce;
            _nft[i].transferFrom(msg.sender, vault, _id[i]);
            emit NewListing(address(_nft[i]), _id[i], _price[i], nftSale[nftNonce[address(_nft[i])][_id[i]]].endTime);
            saleNonce++;
        }
    }

    function adjustBatchSale(address[] memory _nft, uint[] memory _id, uint[] memory _price, uint[] memory _saleTime) external {
        uint amount = _nft.length;
        for(uint i = 0; i < amount; i++) {
            require(nftSale[nftNonce[address(_nft[i])][_id[i]]].seller == msg.sender && !nftSale[nftNonce[_nft[i]][_id[i]]].completed);
            nftSale[nftNonce[_nft[i]][_id[i]]] = SaleInfo({
                seller : msg.sender,
                buyer : address(0),
                nft : _nft[i],
                id : _id[i],
                price : _price[i],
                endTime : block.timestamp + _saleTime[i],
                completed : false
            });
            emit SaleChanged(_nft[i], _id[i], _price[i], block.timestamp + _saleTime[i]);
        }
    }

    function cancelBatchSale(IERC721[] memory _nft, uint[] memory _id) external {
        uint amount = _nft.length;
        for(uint i = 0; i < amount; i++) {
            require(nftSale[nftNonce[address(_nft[i])][_id[i]]].seller == msg.sender && !nftSale[nftNonce[address(_nft[i])][_id[i]]].completed);
            saleStatus[nftNonce[address(_nft[i])][_id[i]]] = false;
            Vault(vault).sendToken(_nft[i], _id[i], vault, msg.sender);
            emit SaleCanceled(address(_nft[i]), _id[i]);
        }
    }

    

    function checkOutSingle(IERC721 _nft, uint _id) payable external {
        require(
            msg.value == nftSale[nftNonce[address(_nft)][_id]].price 
            && nftStatus[address(_nft)][_id]
            && !nftSale[nftNonce[address(_nft)][_id]].completed
        );
        
        address seller = nftSale[nftNonce[address(_nft)][_id]].seller;
        uint nonce = nftNonce[address(_nft)][_id];
        nftSale[nonce].buyer = msg.sender;
        nftSale[nonce].completed = true;

        userPurchase[msg.sender].push(nftSale[nonce]);

        nftNonce[address(_nft)][_id]++;

        (bool sent, ) = seller.call{value: nftSale[nonce].price}("");
        require(sent, "Failed to send Ether");
        Vault(vault).sendToken(_nft, _id, vault, msg.sender);

        emit Purchase(address(_nft), _id, nftSale[nonce].price);
    }

    function checkOutBatch(IERC721[] memory _nft, uint[] memory _id) payable external {
        uint amount = _nft.length;
        uint totalBatchPrice = getBatchCost(_nft, _id);
        require(msg.value == totalBatchPrice);
        for(uint j = 0; j < amount; j++) {
            require(
                nftStatus[address(_nft[j])][_id[j]]
                && !nftSale[nftNonce[address(_nft[j])][_id[j]]].completed
            );

            uint nonce = nftNonce[address(_nft[j])][_id[j]];
            address seller = nftSale[nonce].seller;
            nftSale[nonce].buyer = msg.sender;
            nftSale[nonce].completed = true;

            userPurchase[msg.sender].push(nftSale[nonce]);

            nftNonce[address(_nft[j])][_id[j]]++;

            (bool sent, ) = seller.call{value: nftSale[nonce].price}("");
            require(sent, "Failed to send Ether");
            Vault(vault).sendToken(_nft[j], _id[j], vault, msg.sender);
            
            emit Purchase(address(_nft[j]), _id[j], nftSale[nonce].price);
        }
    }

    

    function getBatchCost(IERC721[] memory _nft, uint[] memory _id) view public returns(uint totalBatchPrice){
        uint amount = _nft.length;
        for(uint i = 0; i < amount; i++) {
            totalBatchPrice += nftSale[nftNonce[address(_nft[i])][_id[i]]].price;
        }
    }

    function getSingleCost(address _nft, uint _id) view external returns(uint price){
        price = nftSale[nftNonce[_nft][_id]].price;
    }

}
