
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC1155/ERC1155.sol";
import "@openzeppelin/contracts/utils/Counters.sol";

contract Launchpad is ERC1155 {
    using Counters for Counters.Counter;
    Counters.Counter private ID;

    
    mapping(uint256 => string) private idToUri;

    
    mapping(uint256 => uint256) private tokenSupply;

    constructor(string memory _uri) ERC1155(_uri) {}

    function create(string calldata _cid, bytes calldata _data)
        external
        returns (uint256 _id)
    {
        _id = _nextId();

        _mint(msg.sender, _id, 0, _data);

        string memory _uri = _createUri(_cid);
        idToUri[_id] = _uri;

        emit URI(_uri, _id);
    }

    function mint(
        address _account,
        uint256 _id,
        bytes calldata _data
    ) public {
        require(_exists(_id), "Err: Invalid ID");

        _mint(_account, _id, 1, _data);

        tokenSupply[_id]++;
    }

    function _nextId() internal returns (uint256 id) {
        ID.increment();
        return ID.current();
    }

    function _exists(uint256 _id) internal view returns (bool) {
        return (bytes(idToUri[_id]).length > 0);
    }

    function _createUri(string memory _cid)
        internal
        view
        returns (string memory _uri)
    {
        string memory baseUri = super.uri(0);
        return string(abi.encodePacked(baseUri, _cid));
    }

    function uri(uint256 _id) public view override returns (string memory) {
        return idToUri[_id];
    }
}

