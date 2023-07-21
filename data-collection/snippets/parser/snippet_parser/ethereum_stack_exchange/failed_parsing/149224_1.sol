    Marker[] internal IncludeMarkers;
    Marker[] internal ExcludeMarkers;

    .
    .

    function setMarkers((bytes4 key, bytes12 category, bool include)[] calldata _markers) external
    {
        delete(IncludeMarkers);
        delete(ExcludeMarkers);

        for(uint i = 0; i < _markers.length; i++)
        {
            if (_markers[i].include)
            {
                IncludeMarkers.push(Marker(key, category));
            }
            else
            {
                ExcludeMarkers.push(Marker(key, category));
            }
        }
    }
