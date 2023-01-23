

pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC1155/ERC1155.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/utils/Counters.sol";
import "@openzeppelin/contracts/utils/Strings.sol";
import "@openzeppelin/contracts/finance/PaymentSplitter.sol";

import "./ICollection.sol";

contract Collection is ICollection, ERC1155, Ownable, PaymentSplitter {
    using Counters for Counters.Counter;
    Counters.Counter private ID;

    string public name;
    string public symbol;

    uint256 private startingAt;

    
    mapping(uint256 => string) private idToUri;

    
    mapping(uint256 => uint256) private maxSupply;

    
    mapping(uint256 => uint256) private totalSupply;

    constructor(
        string memory _uri,
        string memory _name,
        string memory _symbol,
        uint256 _startingAt,
        address[] memory _payees,
        uint256[] memory _shares
    ) payable ERC1155(_uri) PaymentSplitter(_payees, _shares) {
        require(_startingAt > block.timestamp, "Invalid timestamp"); 
        name = _name;
        symbol = _symbol;
        startingAt = _startingAt;
    }

    function create(string calldata _cid, uint256 _maxSupply)
        external
        payable
        override
        onlyOwner
        returns (uint256 _id)
    {
        require(startingAt > block.timestamp, "Already started");
        require(_maxSupply > 0, "Supply > 0");

        _id = _nextId();

        maxSupply[_id] = _maxSupply;
        totalSupply[_id] = 0;

        string memory _uri = _createUri(_cid);
        idToUri[_id] = _uri;

        _mint(msg.sender, _id, 0, "");

        emit Created(_uri, _id, msg.sender);
    }

    function mint(address _account, uint256 _id) external onlyOwner {
        require(startingAt < block.timestamp, "Not started");
        require(_exists(_id), "Invalid id");
        require(totalSupply[_id] < maxSupply[_id], "Limit Reached");

        totalSupply[_id] = totalSupply[_id] + 1;

        _mint(_account, _id, 1, "");
    }

    function uri(uint256 _id) public view override returns (string memory) {
        return idToUri[_id];
    }

    function _nextId() private returns (uint256 id) {
        ID.increment();
        return ID.current();
    }

    function _exists(uint256 _id) private view returns (bool) {
        return (bytes(idToUri[_id]).length > 0);
    }

    function _createUri(string memory _cid)
        private
        view
        returns (string memory _uri)
    {
        string memory baseUri = super.uri(0);
        return string(abi.encodePacked(baseUri, _cid));
    }
}

