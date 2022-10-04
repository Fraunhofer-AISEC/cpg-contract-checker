contract StorageFactory {

    struct SimpleStorage{
        string name;
        uint data;
    }

    SimpleStorage[] public simpleStorageArray;
}
