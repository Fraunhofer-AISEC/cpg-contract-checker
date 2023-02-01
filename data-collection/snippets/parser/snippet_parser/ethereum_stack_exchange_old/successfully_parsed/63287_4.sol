function _setAvatarNumber(uint8 _newAvatarNumber) public {
    uint _something = _storage.returnRandomValue();
    _storage.setAvatarNumber(_newAvatarNumber, msg.sender);
    emit avatarSet(_contractName, _newAvatarNumber);
}
