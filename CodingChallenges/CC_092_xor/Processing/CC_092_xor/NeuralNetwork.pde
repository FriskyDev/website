// https://github.com/CodingTrain/Toy-Neural-Network-JS
// Processing transcription: Chuck England

import java.util.*;

public interface IActivation {
  public float func(float val);
}

class ActivationFunction {
  IActivation func;
  IActivation dfunc;
  
  ActivationFunction(IActivation func_, IActivation dfunc_) {
    func = func_;
    dfunc = dfunc_;
  }
};

ActivationFunction sigmoid = new ActivationFunction(
  new IActivation() { float func(float x) { return 1 / (1 + (float) Math.exp(-x)); } },
  new IActivation() { float func(float y) { return y * (1 - y); } }
);

ActivationFunction tanh = new ActivationFunction(
  new IActivation() { float func(float x) { return (float) Math.tanh(x); } },
  new IActivation() { float func(float y) { return 1 - (y * y); } }
);


class NeuralNetwork {
  float learning_rate;
  int input_nodes;
  int hidden_nodes;
  int output_nodes;
  Matrix weights_ih;
  Matrix weights_ho;
  
  NeuralNetwork(int input_nodes_, int hidden_nodes_, int output_nodes_) {
    input_nodes = input_nodes_;
    hidden_nodes = hidden_nodes_;
    output_nodes = output_nodes_;

  weights_ih = new Matrix(hidden_nodes, input_nodes);
  weights_ho = new Matrix(output_nodes, hidden_nodes);
  weights_ih.randomize();
  weights_ho.randomize();

  //  this.bias_h = new Matrix(this.hidden_nodes, 1);
  //  this.bias_o = new Matrix(this.output_nodes, 1);
  //  this.bias_h.randomize();
  //  this.bias_o.randomize();
  setLearningRate();

  //  this.setActivationFunction();
  }

  //predict(input_array) {
  //  // Generating the Hidden Outputs
  //  let inputs = Matrix.fromArray(input_array);
  //  let hidden = Matrix.multiply(this.weights_ih, inputs);
  //  hidden.add(this.bias_h);
  //  // activation function!
  //  hidden.map(this.activation_function.func);

  //  // Generating the output's output!
  //  let output = Matrix.multiply(this.weights_ho, hidden);
  //  output.add(this.bias_o);
  //  output.map(this.activation_function.func);

  //  // Sending back to the caller!
  //  return output.toArray();
  //}

  void setLearningRate() {
    setLearningRate(0.1);
  }

  void setLearningRate(float learning_rate) {
    learning_rate = learning_rate;
  }

  //setActivationFunction(func = sigmoid) {
  //  this.activation_function = func;
  //}

  void train(float input_array[], float target_array[]) {
    //// Generating the Hidden Outputs
    //let inputs = Matrix.fromArray(input_array);
    //let hidden = Matrix.multiply(this.weights_ih, inputs);
    //hidden.add(this.bias_h);
    //// activation function!
    //hidden.map(this.activation_function.func);

    //// Generating the output's output!
    //let outputs = Matrix.multiply(this.weights_ho, hidden);
    //outputs.add(this.bias_o);
    //outputs.map(this.activation_function.func);

    //// Convert array to matrix object
    //let targets = Matrix.fromArray(target_array);

    //// Calculate the error
    //// ERROR = TARGETS - OUTPUTS
    //let output_errors = Matrix.subtract(targets, outputs);

    //// let gradient = outputs * (1 - outputs);
    //// Calculate gradient
    //let gradients = Matrix.map(outputs, this.activation_function.dfunc);
    //gradients.multiply(output_errors);
    //gradients.multiply(this.learning_rate);


    //// Calculate deltas
    //let hidden_T = Matrix.transpose(hidden);
    //let weight_ho_deltas = Matrix.multiply(gradients, hidden_T);

    //// Adjust the weights by deltas
    //this.weights_ho.add(weight_ho_deltas);
    //// Adjust the bias by its deltas (which is just the gradients)
    //this.bias_o.add(gradients);

    //// Calculate the hidden layer errors
    //let who_t = Matrix.transpose(this.weights_ho);
    //let hidden_errors = Matrix.multiply(who_t, output_errors);

    //// Calculate hidden gradient
    //let hidden_gradient = Matrix.map(hidden, this.activation_function.dfunc);
    //hidden_gradient.multiply(hidden_errors);
    //hidden_gradient.multiply(this.learning_rate);

    //// Calcuate input->hidden deltas
    //let inputs_T = Matrix.transpose(inputs);
    //let weight_ih_deltas = Matrix.multiply(hidden_gradient, inputs_T);

    //this.weights_ih.add(weight_ih_deltas);
    //// Adjust the bias by its deltas (which is just the gradients)
    //this.bias_h.add(hidden_gradient);

    //// outputs.print();
    //// targets.print();
    //// error.print();
    }

  //String serialize() {
  //  return JSON.stringify(this);
  //}

  //static deserialize(data) {
  //  if (typeof data == 'string') {
  //    data = JSON.parse(data);
  //  }
  //  let nn = new NeuralNetwork(data.input_nodes, data.hidden_nodes, data.output_nodes);
  //  nn.weights_ih = Matrix.deserialize(data.weights_ih);
  //  nn.weights_ho = Matrix.deserialize(data.weights_ho);
  //  nn.bias_h = Matrix.deserialize(data.bias_h);
  //  nn.bias_o = Matrix.deserialize(data.bias_o);
  //  nn.learning_rate = data.learning_rate;
  //  return nn;
  //}
  };
