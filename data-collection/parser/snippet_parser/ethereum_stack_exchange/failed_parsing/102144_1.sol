
for (uint256 i = 0; i < actions.length; i++) {
     Actions.ActionArgs memory arg = actions[i];
     Actions.ActionType actionType = arg.actionType;  
     Actions.MarketLayout marketLayout = Actions.getMarketLayout(actionType);  
     Actions.AccountLayout accountLayout = Actions.getAccountLayout(actionType);
     
     

     
     if (accountLayout != Actions.AccountLayout.OnePrimary) { 
          Require.that(
           arg.accountId != arg.otherAccountId,
           FILE,
           "Duplicate accounts in action",
           i
          );
