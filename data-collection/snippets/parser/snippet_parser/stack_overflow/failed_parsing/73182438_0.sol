contract Nft is ERC1155{
    using Counters for Counters.Counter;
    Counters.Counter private id;

    event MintBatch(address indexed _to, uint256[] _ids, uint256[] _amounts);

    function mintBatch(
            address _to,
            uint256[] memory _amounts,
            address[][] memory _recipients,
            uint256[][] memory _values,
        ) external {
           uint256 _id;
           uint256[] memory _ids = new uint256[](_amounts.length); 
           for (uint256 i; i < _amounts.length; i++){
                id.increment();
                _id = id.current();
                _ids[i]= _id;
            }
            
            _mintBatch(_to, _ids, _amounts, '');
            emit MintBatch(_to, _ids, _amounts);

        }
}
