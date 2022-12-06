var outerScopeVar; 
$.post('loldog', function(response) {  
    outerScopeVar = response;
});
alert("Lets wait for some time here! Waiting is fun");  
alert(outerScopeVar);  
