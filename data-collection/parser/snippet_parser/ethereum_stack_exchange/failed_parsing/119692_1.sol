function createDao(string calldata daoName, address creator) external {
    ..
    DaoRegistry dao = DaoRegistry(_createClone(identityAddress));

    ..

    dao.initialize(creator, msg.sender);
    ..
}
