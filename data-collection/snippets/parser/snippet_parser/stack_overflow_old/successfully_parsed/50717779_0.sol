function  request(string _method,string _url,string _header,string _params) payable {
    oraclize_query("computation",[IPFSline,_method,_url,_header,_params]);
}
