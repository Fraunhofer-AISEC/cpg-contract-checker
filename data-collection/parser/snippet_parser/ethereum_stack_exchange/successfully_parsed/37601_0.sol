function () public {

    bool callSuccess = upgradableContractAddress.delegatecall(msg.data);

    if (callSuccess) {
        assembly {
            returndatacopy(0x0, 0x0, returndatasize)
            return(0x0, returndatasize)
        }
    } else {
        revert();
    }
}
