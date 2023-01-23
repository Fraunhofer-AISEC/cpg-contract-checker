pragma solidity ^0.7.0;

import "./UpgradeableProxy.sol";

/**
 * This contract implements a proxy that is upgradeable by an admin.
 * 
 * To avoid https:
 * clashing], which can potentially be used in an attack, this contract uses the
 * https:
 * things that go hand in hand:
 * 
 * 1. If any account other than the admin calls the proxy, the call will be forwarded to the implementation, even if
 * that call matches one of the admin functions exposed by the proxy itself.
 *
 * 2. If the admin calls the proxy, it can access the admin functions, but its calls will never be forwarded to the
 * implementation. If the admin tries to call a function on the implementation it will fail with an error that says
 * "admin cannot fallback to proxy target".
 * 
