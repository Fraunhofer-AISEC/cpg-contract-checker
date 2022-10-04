function usuallyCheapFunction() external {
    ... do something cheap...
    if(rareCondition == true) {
        expensiveCleanupFunction();
    }
}

function expensiveCleanupFunction() internal {
   ... shuffle around some storage ...
}
