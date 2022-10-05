function file(bytes32 what, uint256 data) external note {
    require(live == 1, "Pot/not-live");
    require(now == rho, "Pot/rho-not-updated");
    if (what == "dsr") dsr = data;
    else revert("Pot/file-unrecognized-param");
}
