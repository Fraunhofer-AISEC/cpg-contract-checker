    Marker[] internal Markers;

    .
    .

    function setMarkers(Marker[] calldata _markers) external
    {
        delete(Markers);

        for(uint i = 0; i < _markers.length; i++)
        {
            Markers.push(_markers[i]);
        }
    }
