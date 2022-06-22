


pragma solidity ^0.8.0;

import "./AmaFansCoreStorage.sol";

import "@openzeppelin/contracts-upgradeable@v4.4.2/security/ReentrancyGuardUpgradeable.sol";
import "@openzeppelin/contracts-upgradeable@v4.4.2/utils/AddressUpgradeable.sol";
import "@openzeppelin/contracts-upgradeable@v4.4.2/access/AccessControlEnumerableUpgradeable.sol";
import "@openzeppelin/contracts-upgradeable@v4.4.2/security/PausableUpgradeable.sol";
import "@openzeppelin/contracts-upgradeable@v4.4.2/proxy/utils/Initializable.sol";

import "@openzeppelin/contracts-upgradeable@4.4.2/utils/CountersUpgradeable.sol";
import "@openzeppelin/contracts-upgradeable@v4.4.2/metatx/ERC2771ContextUpgradeable.sol";

import "./ENS.sol";
import "./AmaFansLib.sol";
import "./AmaFansNFT.sol";
import "./AmaFansCoreEvents.sol";
import "./AmaSessions/IAmaSession.sol";
contract AmaFansCore is AmaFansCoreEvents,
                        Initializable, 
                        PausableUpgradeable,
                        ERC2771ContextUpgradeable,
                        AccessControlEnumerableUpgradeable,
                        ReentrancyGuardUpgradeable,
                        AmaFansCoreStorage{}

