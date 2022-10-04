event FootballerCreated(bytes32 hashId);

function newProduct(string name, uint price, Position position) public {
    ...
    emit FootballerCreated (hashId);
}
