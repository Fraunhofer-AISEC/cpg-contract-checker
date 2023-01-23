mapping(string => uint256[]) private _objects;

function getObjects(string memory world)
    public
    view
    returns (uint256[] memory)
{
    return _objects[world];
}

function addObject(string memory world, uint256 object) public {
    _objects[world].push(object);
}

function removeObject(string memory world, uint256 object) public {
    uint256 i = _find(world, object);
    _removeByIndex(world, i);
}

function _find(string memory world, uint256 object)
    private
    returns (uint256)
{
    uint256 i = 0;
    while (_objects[world][i] != object) {
        i++;
    }
    return i;
}

function _removeByIndex(string memory world, uint256 i) private {
    while (i < _objects[world].length - 1) {
        _objects[world][i] = _objects[world][i + 1];
        i++;
    }
    _objects[world].pop();
}
