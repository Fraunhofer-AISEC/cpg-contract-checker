  event ev(bool is_granted)
  function grantAccess(address assetAddr) {
        registry[assetAddr] = true;
        ev(registry[assetAddr]);
    }
