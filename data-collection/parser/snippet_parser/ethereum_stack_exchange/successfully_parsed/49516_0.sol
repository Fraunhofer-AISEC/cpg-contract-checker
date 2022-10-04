contract gaussianDistribution {

struct BellCurve {
    uint population;
    uint total;
    uint mean;
    uint standardDeviation;
    mapping(address => uint) plot;
    mapping(address => uint) differences;
    uint differences_squared_sum;
    uint variance;
    mapping(address => uint) sigma;
}

BellCurve bellcurve;

function calculateMean() {
  require(bellcurve.mean == 0);
  bellcurve.mean = bellcurve.total / bellcurve.population;
}

function calculateDifference(address _node) {
  require(bellcurve.variance == 0);
  uint mean = bellcurve.mean;
  require(mean != 0); 
  uint plot = bellcurve.plot[_node];
  require(plot != 0); 
  require(bellcurve.differences[_node] == 0); 
  uint difference = mean - plot;
  bellcurve.differences[_node] = difference;
  bellcurve.differences_squared_sum += difference^2;
}

function calculateVariance() {
  uint variance = bellcurve.differences_squared_sum / bellcurve.population;
  bellcurve.variance = variance;
}

  function calculateStandardDeviation() {
    uint variance = bellcurve.variance;
    require(variance != 0);
    bellcurve.standardDeviation = sqrt(bellcurve.variance);
}

function sqrt(uint x) returns (uint y) {
    uint z = (x + 1) / 2;
    y = x;
    while (z < y) {
        y = z;
        z = (x / z + z) / 2;
    }
}


}
