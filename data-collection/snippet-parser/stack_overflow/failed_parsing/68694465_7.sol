var foo, callback;
async.function(function(response) {
    foo = "foobar";

    if( typeof callback == 'function' ){
        callback(foo);
    }
});

module.exports = function(cb){
    if(typeof foo != 'undefined'){
        cb(foo); 
    } else {
        callback = cb;
    }
}
