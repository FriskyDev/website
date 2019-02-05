// https://github.com/CodingTrain/Toy-Neural-Network-JS
// Processing transcription: Chuck England

interface FunctionMapper {
  float Map(float x, int i, int j);
};

class Matrix {
  int rows;
  int cols;
  float data[][];
  

  Matrix(int rows_, int cols_) {
    rows = rows_;
    cols = cols_;
    data = new float[rows][cols];
    //data = Array(rows).fill().map(() => Array(cols).fill(0));
  }

  //static Matrix fromArray(arr) {
  //  return new Matrix(arr.length, 1).map((e, i) => arr[i]);
  //}

  //static Matrix subtract(Matrix a, Matrix b) {
  //  if (a.rows !== b.rows || a.cols !== b.cols) {
  //    println("Columns and Rows of A must match Columns and Rows of B.");
  //    return null;
  //  }

  //  // Return a new Matrix a-b
  //  return new Matrix(a.rows, a.cols)
  //    .map((_, i, j) => a.data[i][j] - b.data[i][j]);
  //}

  //float[][] toArray() {
  //  let arr = [];
  //  for (let i = 0; i < this.rows; i++) {
  //    for (let j = 0; j < this.cols; j++) {
  //      arr.push(this.data[i][j]);
  //    }
  //  }
  //  return arr;
  //}

  Matrix randomize() {
    return map(new FunctionMapper() {
      public float Map(float x, int i, int j) {
        return (float) Math.random() * 2 - 1;
      }
    });
  }

  //Matrix add(n) {
  //  if (n instanceof Matrix) {
  //    if (this.rows !== n.rows || this.cols !== n.cols) {
  //      console.log('Columns and Rows of A must match Columns and Rows of B.');
  //      return;
  //    }
  //    return this.map((e, i, j) => e + n.data[i][j]);
  //  } else {
  //    return this.map(e => e + n);
  //  }
  //}

  //static Matrix transpose(Matrix matrix) {
  //  return new Matrix(matrix.cols, matrix.rows)
  //    .map((_, i, j) => matrix.data[j][i]);
  //}

  //static Matrix multiply(Matrix a, Matrix b) {
  //  // Matrix product
  //  if (a.cols !== b.rows) {
  //    println("Columns of A must match rows of B.")
  //    return null;
  //  }

  //  return new Matrix(a.rows, b.cols)
  //    .map((e, i, j) => {
  //      // Dot product of values in col
  //      let sum = 0;
  //      for (let k = 0; k < a.cols; k++) {
  //        sum += a.data[i][k] * b.data[k][j];
  //      }
  //      return sum;
  //    });
  //}

  //Matrix multiply(n) {
  //  if (n instanceof Matrix) {
  //    if (this.rows !== n.rows || this.cols !== n.cols) {
  //      console.log('Columns and Rows of A must match Columns and Rows of B.');
  //      return;
  //    }

  //    // hadamard product
  //    return this.map((e, i, j) => e * n.data[i][j]);
  //  } else {
  //    // Scalar product
  //    return this.map(e => e * n);
  //  }
  //}

  Matrix map(FunctionMapper fm) {
    // Apply a function to every element of matrix
    for (int i = 0; i < rows; i++) {
      for (int j = 0; j < cols; j++) {
        float val = data[i][j];
        data[i][j] = fm.Map(val, i, j);
      }
    }
    return this;
  }

  //static Matrix map(matrix, func) {
  //  // Apply a function to every element of matrix
  //  return new Matrix(matrix.rows, matrix.cols)
  //    .map((e, i, j) => func(matrix.data[i][j], i, j));
  //}

  //Matrix print() {
  //  for (int r = 0;r < rows;r++) {
  //    String row = "[[";
  //    for (int c = 0;c < cols;c++) {
  //      if (c != 0) { row += ", " }
  //      row += String.format("%f", data[r][c]);
  //    }
  //    row += "]]";
  //    printn(row);
  //  }
  //  return this;
  //}

  //String serialize() {
  //  return JSONUtils.valueToString(this, 8, 4);
  //}

  //static Matrix deserialize(String data) {
  //  data = JSON.parse(data);
  //  Matrix matrix = new Matrix(data.rows, data.cols);
  //  matrix.data = data.data;
  //  return matrix;
  //}
}
