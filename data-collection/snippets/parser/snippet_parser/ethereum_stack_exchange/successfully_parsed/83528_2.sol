(bool success, bytes memory res) = _destination.call.gas(_gasLimit).value(_value)(_data);


if (!success) {
    string memory _revertMsg = _getRevertMsg(res);
}
