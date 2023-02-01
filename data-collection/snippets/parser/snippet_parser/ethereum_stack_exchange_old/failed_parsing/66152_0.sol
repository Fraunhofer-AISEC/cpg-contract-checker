contract DigitalDownload {

    ...

    event DigitalDownloadPurchasedEvent(uint time, address purchaser)

    ...

    function purchaseDigitalDownload() public payable {
        require(msg.value == PRICE);

        emit DigitalDownloadPurchasedEvent(now, msg.sender);
    }
}

buyer --- > BC: purchaseService transaction

buyer --- signed http req ---> Server: download content
...the request is signed with the private key of the msg.sender...
...server makes ecrecover on the signature and recovers the public ethereum address of the request sender...

server ---> BC: check `DigitalDownloadPurchasedEvent` exists for the address recovered from the signature and serve the file if yes.
