contract DAO is DAOInterface, Token, TokenCreation {

    ...
    function splitDAO(
        uint _proposalID,
        address _newCurator
    ) noEther onlyTokenholders returns (bool _success) {
        ...
        p.splitData[0].newDAO = createNewDAO(_newCurator);
        ...
    }

    ...
    function createNewDAO(address _newCurator) internal returns (DAO _newDAO) {
        NewCurator(_newCurator);
        return daoCreator.createDAO(_newCurator, 0, 0, now + splitExecutionPeriod);
    }
    ...
}
