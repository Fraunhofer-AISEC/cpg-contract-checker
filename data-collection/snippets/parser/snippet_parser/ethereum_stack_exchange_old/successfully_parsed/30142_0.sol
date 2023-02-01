contract WTF {

        struct Magic {
            bytes32 id;
            string name;
            address[] watchers;
        }

        uint _nonce;

        mapping (bytes32 => Magic) public allMagic;

        uint private _numWatchersMax = 16;

        function countWatchers(Magic magic) internal returns(uint) {
            uint count;
            uint i;
            for (i = 0; i < magic.watchers.length; i++) {
                if (address(0) != magic.watchers[i]) {
                    count++;
                }
            }
            return count;
        }

        function registerMagicWatcher(Magic magic, address watcher) internal returns(bool success) {
            magic.watchers[countWatchers(magic)] = watcher;
            return true;
        }

        function createMagic(string name) public returns(bytes32 magicId) {
            Magic memory magic = Magic({
                id: keccak256(msg.sender, name, _nonce++),
                name: name,
                watchers: new address[](_numWatchersMax)
            });

            require(registerMagicWatcher(magic, msg.sender));

            return magic.id;
        }

        function getMagicWatchers(bytes32 magicId) returns(address[] watchers) {
            return allMagic[magicId].watchers;
        }

        function watchMagic(bytes32 magicId) returns(bool success) {
            require(allMagic[magicId].id == magicId); 
            require(countWatchers(allMagic[magicId]) < _numWatchersMax);

            bool alreadyWatcher = false;
            uint i;
            for (i = 0; i < allMagic[magicId].watchers.length; i++) {
                if (msg.sender == allMagic[magicId].watchers[i]) {
                    alreadyWatcher = true;
                    break;
                }
            }
            require(alreadyWatcher == false);

            require(registerMagicWatcher(allMagic[magicId], msg.sender));
            return true;
        }
}
