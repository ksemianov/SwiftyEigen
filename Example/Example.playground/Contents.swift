import SwiftyEigen

// Create a new 3x3 identity matrix
let matrix = EIGMatrix.identity(rows: 3, cols: 3)

// Change a specific value
let row = 0
let col = 1
matrix[row, col] = -2

// Calculate the inverse of a matrix
let inverseMatrix = matrix.inverse()
