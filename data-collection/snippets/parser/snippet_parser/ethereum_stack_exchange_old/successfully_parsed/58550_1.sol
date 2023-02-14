pragma solidity 0.4.24;

contract TimeStamps {

    mapping(address => uint[]) public addressTimeStamps;
    mapping(address => bool) public isContentProvider;
    address[] public contentProviders;

    

    event LogNewAddressTimeStamp(address sender, address contentProvider, uint timeStamp);

    function setTimeStamp(address contentProvider, uint timeStamp) public returns(bool success) {
        require(contentProvider != 0);
        require(timeStamp != 0);
        if(!isContentProvider[contentProvider]) {
            isContentProvider[contentProvider] = true;
            contentProviders.push(contentProvider);
        }
        addressTimeStamps[contentProvider].push(timeStamp);
        emit LogNewAddressTimeStamp(msg.sender, contentProvider, timeStamp);
        return true;
    }


    

    function getTimeStamp(address contentProvider, uint row) public view returns(uint timeStamp) {
        return(addressTimeStamps[contentProvider][row]);
    }

    

    function getAddressTimeStampCount(address contentProvider) public view returns(uint count) {
        return addressTimeStamps[contentProvider].length;
    }

    function getContentProviderCount() public view returns(uint count) {
        return contentProviders.length;
    }

}
