// Daniel Shiffman
// http://codingtra.in
// http://patreon.com/codingtrain
// Processing transcription: Chuck England

// XOR
// https://youtu.be/188B6k_F9jU

// Neural Network Library
// https://github.com/CodingTrain/Toy-Neural-Network-JS

NeuralNetwork nn;
Slider lr_slider;

class TrainingData {
  float inputs[];
  float outputs[];

  TrainingData(float inputs_[], float outputs_[]) {
    inputs = inputs_.clone();
    outputs = outputs_.clone();
  }
};

TrainingData training_data[] = {
  new TrainingData(new float[] {0, 0}, new float[] {0}),
  new TrainingData(new float[] {0, 1}, new float[] {1}),
  new TrainingData(new float[] {1, 0}, new float[] {1}),
  new TrainingData(new float[] {1, 1}, new float[] {0}),
};

void setup() {
  size(400, 400);
  nn = new NeuralNetwork(2, 4, 1);
  lr_slider = new Slider(20, height - 20, 0.01, 0.5, 0.1, 0.01);
}

void draw() {
  background(0);

  for (int i = 0; i < 100; i++) {
    TrainingData data = training_data[int(random(training_data.length))];
    nn.train(data.inputs, data.outputs);
  } 

  //nn.setLearningRate(lr_slider.value());

  //let resolution = 10;
  //let cols = width / resolution;
  //let rows = height / resolution;
  //for (int i = 0; i < cols; i++) {
  //  for (int j = 0; j < rows; j++) {
  //    let x1 = i / cols;
  //    let x2 = j / rows;
  //    let inputs = [x1, x2];
  //    let y = nn.predict(inputs);
  //    noStroke();
  //    fill(y * 255);
  //    rect(i * resolution, j * resolution, resolution, resolution);
  //  }
  //}

  lr_slider.show();
}
