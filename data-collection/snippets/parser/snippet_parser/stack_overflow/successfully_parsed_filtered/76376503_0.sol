function dissmissRegulator(address _regulatorAddress) public {
    if (msg.sender != s_regulators[msg.sender].regulatorAddress) {
    revert EMR__OnlyRegulatorsCanAddOrRemoveRegulators();
    }

    if (s_regulators[_regulatorAddress].regulatorAddress != _regulatorAddress) {
    revert EMR__RegulatorDoesNotExist();
    }

    delete s_regulators[_regulatorAddress];
}
