
Pragma solidity >=0.6.6

contract Quapura is BEP20('Quapura', 'APUR') {
    
    function mintTo(address _to, uint256 _amount) public onlyOwner {
        _mint(_to, _amount);
        _moveDelegates(address(0), _delegates[_to], _amount);
    }

    
    mapping(address => address) internal _delegates;

    
    struct Checkpoint {
        uint32 fromBlock;
        uint256 votes;
    }


        _name = _NAME;
        _symbol = _SYMBOL;
        _decimals = _DECIMALS;
        _tTotal = _supply * 10 ** _decimals;
        _rTotal = (MAX - (MAX % _tTotal));
        _taxFee = _txFee;
        _liquidityFee = _lpFee;
        _previousTaxFee = _txFee;
        
        _devFee = _DexFee;
        _previousDevFee = _devFee;
        _previousLiquidityFee = _lpFee;
        _maxTxAmount = (_tTotal * 2 / 1000) * 10 ** _decimals;
        numTokensSellToAddToLiquidity = (_tTotal * 3 / 10000) * 10 ** _decimals;
        _devWalletAddress = feeaddress;
        
        _rOwned[tokenOwner] = _rTotal;
   }
}

