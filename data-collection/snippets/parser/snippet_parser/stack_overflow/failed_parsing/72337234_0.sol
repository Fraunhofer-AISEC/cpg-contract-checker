
struct Singer {
uint id;
uint[] events_ids; 
}

struct Event {
uint id;
uint singer_id;
}

singer[] public SingerList;
event[] public EventList;
uint public n_singers;
uint public n_events;

    function CreateEvent(uint singer_id) external {
        if (singer_id > n_singers) { 
            revert SingerIdError(singer_id);
        }
        else if (singer_id == n_singers){ 
            n_singers ++;
-------->   SingerList.push(Singer(singer_id))); 
            EventList.push(Event(n_events, singer_id));
            
        }

        else { 
            Singer storage _singer = SingerList[singer_id];
            _singer.event_ids.push(n_events);
            EventList.push(Event(n_events, n_events));
        }
        n_events ++;
    }```
