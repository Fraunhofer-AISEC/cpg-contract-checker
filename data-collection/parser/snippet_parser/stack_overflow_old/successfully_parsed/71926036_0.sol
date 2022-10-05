

pragma solidity ^0.8.4;

contract TestContract {
  struct Item {
    uint itemId;
    uint itemValue;
  }

  struct OverlayingItemStruct {
    mapping(uint => Item) items;
    uint overlayingId;
    uint itemsCount;
  }
  mapping(uint => OverlayingItemStruct) public overlayingItems;
  uint public overlayCount;

  function addOverlayingItemsStruct(uint _value) external {
    overlayCount ++;
    mapping(uint => Item) memory items;
    items[1] = Item(1, _value);
    overlayingItems[overlayCount] = OverlayingItemStruct(items, 1, 1);
  }

  function addItem(uint _value, uint _overlayId) external {
    OverlayingItemStruct storage overlay = overlayingItems[_overlayId];
    overlay.itemsCount ++;

    overlay.items[overlay.itemsCount] = Item(overlay.itemsCount, _value);
  }
}
