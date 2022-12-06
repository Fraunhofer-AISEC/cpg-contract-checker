function _addWhitelisted(address account) internal {
    _whitelisteds.add(account);
    emit WhitelistedAdded(account);
}

function _removeWhitelisted(address account) internal {
    _whitelisteds.remove(account);
    emit WhitelistedRemoved(account);
}
