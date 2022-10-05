import './lib'
contract SimplifiedMainContract {

    using Lib for Lib.Store;
    Lib.Store private store;

    function deposit() public payable {
        store.deposit();
    }

    function withdraw() public {
        store.withdraw();
    }

}
