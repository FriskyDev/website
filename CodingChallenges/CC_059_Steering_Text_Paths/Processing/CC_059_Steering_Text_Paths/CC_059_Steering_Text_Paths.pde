// Daniel Shiffman //<>//
// http://codingtra.in
// Steering Text Paths
// Video: https://www.youtube.com/watch?v=4hA7G3gup-4
// Processing transcription: Chuck England

import java.util.*;
import processing.core.*;

//PFont font;
Vehicle[] vehicles = null;

PVector[] textToPoints(String fontPath, String txt, float x, float y, float fontSize, float detail) {
  float xoff = 0;

  PFont font = createFont(fontPath, fontSize, true);
  List<PVector> result = new ArrayList<PVector>();

  for (int i = 0; i < txt.length(); i++) {
    char ch = txt.charAt(i);
    if (ch != ' ') {
      PShape shape = font.getShape(ch, detail);
      //println(shape.getVertexCount());
      PVector prev = null;
      for (int p = 0; p < shape.getVertexCount(); p++) {
        //println(ch, p);
        PVector pt = shape.getVertex(p);
        pt.x += xoff + x;
        pt.y += y;
        result.add(pt);
        //if (prev != null) {
        //  while (true) {
        //    float d = PVector.dist(prev, pt);
        //    println(ch, d);
        //    if (d > detail) {
        //      PVector npt = prev.copy();
        //      npt.normalize();
        //      println(prev, npt);
        //      npt.mult(detail);
        //      prev = prev.sub(npt);
        //      prev.sub(npt);
        //      result.add(prev);
        //    } else {
        //      break;
        //    }
        //  }
        //}
        //while (pt.mag() > detail) {
        //  PVector npt = pt.copy();
        //  println(pt, npt);
        //  npt.setMag(detail);
        //  pt.sub(npt);
        //  println(pt, npt);
        //  float d = pt.mag() - detail;
        //  if (d > detail) {
        //    pt.setMag(d);
        //    //result.add(pt);
        //  } else {
        //    break;
        //  }
        //}

        result.add(pt);
        prev = pt;
      }

      PFont.Glyph glyph = font.getGlyph(ch);
      println(glyph.width);
      xoff += glyph.width /* fontSize*/;
    }
  }
  return result.toArray(new PVector[result.size()]);
}


void setup() {
  //font = loadFont("AvenirNextLTPro-Demi.otf");

  size(1024, 768);
  background(51);
  // textFont(font);
  // textSize(192);
  // fill(255);
  // noStroke();
  // text('train', 100, 200);

  PVector[] points = textToPoints("AvenirNextLTPro-Demi.otf", "train", 100, 200, 192, 10);

  vehicles = new Vehicle[points.length];
  for (int i = 0; i < points.length; i++) {
    PVector pt = points[i];
    Vehicle vehicle = new Vehicle(pt.x, pt.y);
    vehicles[i] = vehicle;
    // stroke(255);
    // strokeWeight(8);
    // point(pt.x, pt.y);
  }
}

void draw() {
  background(51);
  //translate(100, 200);
  for (int i = 0; i < vehicles.length; i++) {
    Vehicle v = vehicles[i];
    v.behaviors();
    v.update();
    v.show();
  }
}
