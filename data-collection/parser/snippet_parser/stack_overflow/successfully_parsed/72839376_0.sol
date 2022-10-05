
pragma solidity ^0.8.4;

contract Test {
    function getFlightPaths(
        address _airport,
        address[][] memory _paths
    )
        public
        view
        returns (address[][100] memory, uint256[100] memory)
    {
        address[][100] memory flights;
        uint256[100] memory durations;

        for (uint256 i = 0; i < _paths.length; i++) {
            if (i > 99) {
                break;
            }

            address[] memory flightPath = _paths[i];
            flights[i] = flightPath;
            durations[i] = calculateFlightPath(flightPath);
        }

        return (flights, durations);
    }
}
