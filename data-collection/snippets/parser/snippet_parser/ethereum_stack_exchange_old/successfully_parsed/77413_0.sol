struct ItemAddress {
    uint8 sendNatCd;
    uint8 rcvNatCd;
    uint16 ordID;
    string sendAddr;
    string rcvAddr;
}

ItemAddress[] public itemAddresses;

function createItemAddress(
    uint16 _ordID,
    uint8 _sendNatCd,
    uint8 _rcvNatCd,
    string calldata _sendAddr,
    string calldata _rcvAddr
)
    external
    returns
(
    uint256 itemAddressID
)
{
    ItemAddress memory _itemAddress = ItemAddress({
        ordID: _ordID,
        sendNatCd: _sendNatCd,
        rcvNatCd: _rcvNatCd,
        sendAddr: _sendAddr,
        rcvAddr: _rcvAddr
    });

    itemAddressID = itemAddresses.push(_itemAddress) - 1;

    return itemAddressID;
}

function getItemAddress(uint16 id)
    external
    view
    returns
(
    uint16 _ordID,
    uint8 _sendNatCd,
    uint8 _rcvNatCd,
    string memory _sendAddr,
    string memory _rcvAddr
)
{
    ItemAddress storage itemAddress = itemAddresses[id];

    _ordID = itemAddress.ordID;
    _sendNatCd = itemAddress.sendNatCd;
    _rcvNatCd = itemAddress.rcvNatCd;
    _sendAddr = itemAddress.sendAddr;
    _rcvAddr = itemAddress.rcvAddr;
}

function getItemLength()
    public
    view
    returns (uint256)
{
    return itemAddresses.length;
}
