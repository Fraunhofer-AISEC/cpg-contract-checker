contract SimpleSmartAssetManager is Mortal {

  mapping(string => address) smartAssets;

  function SimpleSmartAssetManager() {
    owner = msg.sender;
  }

  function createSmartAsset(string name,
                            uint usagePrice,
                            address[] addresses,
                            uint[] weights) {

    require(addresses.length == weights.length);
    require(smartAssets[name] == address(0x0));

    address assetAddress = new SimpleSmartAsset(usagePrice,
                                                addresses,
                                                weights);
    smartAssets[name] = assetAddress;
  }

  function getUsagePrice(string assetName)
    constant returns (uint) {
    address assetAddress = smartAssets[assetName];
    uint price = getUsagePrice(assetAddress);

    return price;
  }

  function getUsagePrice(address assetAddress)
    constant returns (uint) {
    uint price = SimpleSmartAsset(assetAddress).getUsagePrice();

    return price;
  }

  event AssetUsed(string name, uint usagePrice);

  function useAsset(string name) payable {
    address assetAddress = smartAssets[name];
    uint price = getUsagePrice(assetAddress);

    require (msg.value >= price);

    SimpleSmartAsset(assetAddress).pay.value(msg.value)();

    AssetUsed(name, price);
  }

  function removeAsset(string name) onlyOwner {
    address assetAddress = smartAssets[name];
    SimpleSmartAsset(assetAddress).remove();
  }
}
