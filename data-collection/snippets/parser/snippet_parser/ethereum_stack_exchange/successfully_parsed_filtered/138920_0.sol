mapping(uint => Bgd) _idToMetadata; 
mapping(uint => uint) _maxSupply; 
mapping(uint => uint) _itemsMinted;  
mapping(uint => bool) _approved;  

function addAttachedBackgrounds(Bgd[] calldata bgds)external onlyRole(UPDATER_ROLE){
        for (uint i; i < bgds.length; i++){
            uint id = bgds[i].id;
            _idToMetadata[id] = bgds[i];
            uint s = bgds[i].supply;
            _maxSupply[id] = s;
            if (id > bgdCurrentid){
                bgdCurrentid = id + 1; 
            }
            _approved[id] = true;
        }
    }
