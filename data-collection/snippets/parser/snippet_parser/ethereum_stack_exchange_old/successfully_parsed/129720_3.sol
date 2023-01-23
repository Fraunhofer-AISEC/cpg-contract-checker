function _getStorageBeacon(uint version_) private view returns(StorageBeacon) {
   return StorageBeacon(ozUpgradeableBeacon(beacon).storageBeacon(version_));
}
