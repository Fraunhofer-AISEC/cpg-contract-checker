/Users/patarapichairat/Desktop/solidity/testupgrade/node_modules/hardhat/src/internal/core/providers/http.ts:78
        const error = new ProviderError("HttpProviderError", -1);
                      ^
    ProviderError: Invalid params: invalid type: null, expected a 0x-prefixed hex string with length of 40.
        at HttpProvider.request (/Users/patarapichairat/Desktop/solidity/testupgrade/node_modules/hardhat/src/internal/core/providers/http.ts:78:19)
        at LocalAccountsProvider.request (/Users/patarapichairat/Desktop/solidity/testupgrade/node_modules/hardhat/src/internal/core/providers/accounts.ts:188:34)
        at processTicksAndRejections (node:internal/process/task_queues:96:5)
        at getStorageAt (/Users/patarapichairat/Desktop/solidity/testupgrade/node_modules/@openzeppelin/upgrades-core/src/provider.ts:49:19)
        at getStorageFallback (/Users/patarapichairat/Desktop/solidity/testupgrade/node_modules/@openzeppelin/upgrades-core/src/eip-1967.ts:52:15)
        at getAdminAddress (/Users/patarapichairat/Desktop/solidity/testupgrade/node_modules/@openzeppelin/upgrades-core/src/eip-1967.ts:11:19)
        at getUpgrader (/Users/patarapichairat/Desktop/solidity/testupgrade/node_modules/@openzeppelin/hardhat-upgrades/src/upgrade-proxy.ts:42:26)
        at Proxy.upgradeProxy (/Users/patarapichairat/Desktop/solidity/testupgrade/node_modules/@openzeppelin/hardhat-upgrades/src/upgrade-proxy.ts:27:23)
        at main (/Users/patarapichairat/Desktop/solidity/testupgrade/scripts/upgradev2.js:8:2)
