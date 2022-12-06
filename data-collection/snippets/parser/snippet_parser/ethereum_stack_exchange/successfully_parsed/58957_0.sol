
function computeAverage(address[] _addresses, uint[] _netWorths)
    public
    pure
    returns (uint)
{
    uint average;
    uint sum = 0;
    for (uint i = 0; i < _netWorths.length; i++) {
        sum += _netWorths[i];
    }
    average = sum / _netWorths.length;
    return average;
}


function averageAssets(uint _uint) public onlyEnigma() {
    averageAssetsResult = _uint;
    emit CallbackFinished();
}
