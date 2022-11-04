
pragma solidity 0.8.9;
contract ComeBack {
    uint256 public FavoriteNb;
    uint256 nb = 0;
    function store(uint256 _nb, uint256 _FavoriteNb) public payable {
        _nb = nb;
        while (_nb >= 0) {
            FavoriteNb = _FavoriteNb;
            _nb++;
        }
    }
}
