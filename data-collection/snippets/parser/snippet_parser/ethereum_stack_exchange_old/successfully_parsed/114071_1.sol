contract TimeLockTest is TokenTimelock {
    IERC20 constant myToken = IERC20(0x5B38Da6a701c568545dCfcB03FcB875f56beddC4);
    address constant myWallet = 0x5B38Da6a701c568545dCfcB03FcB875f56beddC4;

    constructor() TokenTimelock(myToken, myWallet, 1654368599) {
    }
}
