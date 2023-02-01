    function setSupplyCap(
        address asset,
        uint256 newSupplyCap
    ) external override onlyRiskOrPoolAdmins {
        DataTypes.ReserveConfigurationMap memory currentConfig = _pool
            .getConfiguration(asset);
        uint256 oldSupplyCap = currentConfig.getSupplyCap();
        currentConfig.setSupplyCap(newSupplyCap);
        _pool.setConfiguration(asset, currentConfig);
        emit SupplyCapChanged(asset, oldSupplyCap, newSupplyCap);
    }
