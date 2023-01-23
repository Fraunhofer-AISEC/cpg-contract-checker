interface IPassItToMe {
    function actionTest(Actions.ActionArgs[] memory actions) external;
}

contract SimpleCallDataTest {

    function actionCallDataTest(address contAddr) public {
        Actions.ActionArgs[] memory operations = new Actions.ActionArgs[](1);

        operations[0] = Actions.ActionArgs({
            actionType: Actions.ActionType.Call,
            accountId: 7,
            amount: Types.AssetAmount({
                sign: true,
                denomination: Types.AssetDenomination.Wei,
                ref: Types.AssetReference.Delta,
                value: 1000
            }),
            primaryMarketId: 8,
            secondaryMarketId: 9,
            otherAddress: address(this),
            otherAccountId: 5,
            data: abi.encode(
                    msg.sender,
                    1000
                )
        });
        IPassItToMe(contAddr).actionTest(operations);
    }

}
