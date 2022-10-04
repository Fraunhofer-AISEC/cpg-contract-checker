
pragma solidity >=0.5.16;

contract storeData {

    uint256 internal index = 0;

    struct IslandFcst {
        uint islandId;
        uint forecastDate;
        uint forecastValue;
    }
    mapping(uint256 => IslandFcst) islandfcst;

    function setData(uint _islandId, uint _forecastDate, uint                    _forecastValue)
    public {

        islandfcst[index] = IslandFcst(_islandId, _forecastDate, _forecastValue);

        index++;

    }

    function getData(uint256 _index) public view returns(uint, uint, uint)

    {
        return (
                    islandfcst[_index].islandId,
                    islandfcst[_index].forecastDate,
                    islandfcst[_index].forecastValue
               );
    }
}
