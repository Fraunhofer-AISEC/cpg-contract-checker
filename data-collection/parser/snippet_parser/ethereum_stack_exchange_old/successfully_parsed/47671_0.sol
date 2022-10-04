pragma solidity ^0.4.0;
contract contracta{
    uint mapsize=10;
    struct request_task{ 
    uint task_id; 
    string ip_address;
    uint flag ;
    uint task_submit_time; 
    uint task_deadline; 
    uint  provided_price; 
    uint bandwidth; 
    }
    request_task[] private request;
    uint internal countera;
    function contracta() internal{
        add(1,"172.168.3.3",1,10,30,5,200);
        add(1,"172.168.3.3",1,10,30,5,200);

    }
    function add(uint _task_id,string _ip_address,uint _flag,uint _task_submit_time,uint _task_deadline,uint  _provided_price,uint _bandwidth) internal{
        request.push(request_task(_task_id,_ip_address,_flag, _task_submit_time,_task_deadline,_provided_price,_bandwidth));
    }
    function get()constant returns(uint){
        return request[1].task_submit_time;
    }

}
