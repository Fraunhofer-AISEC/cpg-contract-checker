contract MyContract {
    string myStorageVariable;

    function removeTheVariable(string strArg) public {
        myStorageVariable = strArg;
        delete myStorageVariable;
    }
}
