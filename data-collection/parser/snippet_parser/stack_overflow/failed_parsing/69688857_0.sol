address[] public migrations;

...

function getMigrations() public view returns (address[] memory) {
        return migrations;
    }
