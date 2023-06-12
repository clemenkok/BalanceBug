const { levenbergMarquardt } = require("ml-levenberg-marquardt");

// Creates linear function using the provided slope and intercept parameters
function circle([pos_x, pos_y]) {
  return (x) => Math.sqrt(Math.pow(pos_x-x[0], 2) + Math.pow(pos_y - x[1], 2)) ;
}

// Input points (x,y) 
const x = [[0, 0],[0, 2],[2, 2]]
const y = [1, 1.5, 2];

// Parameter values to use for first iteration
const initialValues = [2, -1]; // i.e., y = x

export default function nlsr(x, y){
    return result = levenbergMarquardt({ x, y }, circle, { initialValues });
}

// { 
//   parameterValues: [1.9999986750084096, -1.9999943899435104]
//   parameterError: 6.787132159723697e-11
//   iterations: 2
// }