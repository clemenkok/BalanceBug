// Create an empty 35x35 matrix
function generate_initial_map(matrix) {

    for (let i = 0; i < 35; i++) {
        matrix[i] = [];

        // Fill each element with 5 zeroes
        for (let j = 0; j < 35; j++) {
            matrix[i][j] = Array(5).fill(0);
        }
    }

    console.log(matrix)
    return matrix
    
}

module.exports = {
    generate_initial_map
};