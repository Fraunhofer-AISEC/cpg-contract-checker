function donate(PoolKey memory key, uint256 amount0, uint256 amount1)
    external
    override
    noDelegateCall
    onlyByLocker
    returns (BalanceDelta delta)
{
    if (key.hooks.shouldCallBeforeDonate()) {
        if (key.hooks.beforeDonate(msg.sender, key, amount0, amount1) != IHooks.beforeDonate.selector) {
            revert Hooks.InvalidHookResponse();
        }
    }

    delta = _getPool(key).donate(amount0, amount1);

    _accountPoolBalanceDelta(key, delta);

    if (key.hooks.shouldCallAfterDonate()) {
        if (key.hooks.afterDonate(msg.sender, key, amount0, amount1) != IHooks.afterDonate.selector) {
            revert Hooks.InvalidHookResponse();
        }
    }
}
