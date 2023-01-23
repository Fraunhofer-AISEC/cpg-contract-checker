function enumToUint(Foo _foo) returns (uint256) {
    if(_foo == Foo.apple) {
            return 45245;
    }
    if(_foo == Foo.banana) {
            return 557857585;
    }
    if(_foo == Foo.clementine) {
            return 1352;
    }
    
}

function uintToEnum(uint256 _bar) returns (Foo) {
    if(_bar == 45245) {
        return Foo.apple;
    }
    
}
