function _transferStandard(
       address sender,
       address recipient,
       uint256 tAmount
   ) private {
       (
           uint256 rAmount,
           uint256 rTransferAmount,
           uint256 rFee,
           uint256 tTransferAmount,
           uint256 tFee,
           uint256 tTeam
       ) = _getValues(tAmount);
       _rOwned[sender] = _rOwned[sender].sub(rAmount);
       _rOwned[recipient] = _rOwned[recipient].add(rTransferAmount);
       _takeTeam(tTeam);
       _reflectFee(rFee, tFee);
       emit Transfer(sender, recipient, tTransferAmount);
}

function _takeTeam(uint256 tTeam) private {
       uint256 currentRate = _getRate();
       uint256 rTeam = tTeam.mul(currentRate);
       _rOwned[address(this)] = _rOwned[address(this)].add(rTeam);
}

