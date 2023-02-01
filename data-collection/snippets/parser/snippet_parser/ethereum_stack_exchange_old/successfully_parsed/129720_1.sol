function _getStorageBeacon() private view returns(StorageBeacon) {
   return StorageBeacon(ozUpgradeableBeacon(beacon).storageBeacon());
}
