
function fail() { revert("test"); }

(bool success, bytes memory response) = to.call{value: 0}(data);
