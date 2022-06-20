contract ShapeCalculator{
    function rectangle(uint w, uint h) returns (uint s, uint p) {
        
        s = w * h;
        p = 2 * (w + h);
    }
} 
