function getAccountLayout(
    ActionType actionType
)
    internal
    pure
    returns (AccountLayout)
{
    if (
        actionType == Actions.ActionType.Transfer
        || actionType == Actions.ActionType.Trade
    ) {
        return AccountLayout.TwoPrimary;
    } else if (
        actionType == Actions.ActionType.Liquidate
        || actionType == Actions.ActionType.Vaporize
    ) {
        return AccountLayout.PrimaryAndSecondary;
    }
    return AccountLayout.OnePrimary;
}
