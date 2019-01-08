// Daniel Shiffman
// http://codingtra.in
// Steering Text Paths
// Video: https://www.youtube.com/watch?v=4hA7G3gup-4
// Processing transcription: Chuck England

import java.util.*;
import processing.core.*;

//PFont font;
Vehicle[] vehicles = null;

//PVector[] textToPoints(String fontPath, String message, float x, float y, float fontSize) {
//  List<PVector> points = new ArrayList<PVector>();
//  PFont font = createFont(fontPath, fontSize, true);
//  PShape shape = font.getShape('e');
//  for (int i = 0; i < shape.getVertexCount(); i++) {
//    points.add(shape.getVertex(i));
//  }
  
//  return points.toArray(new PVector[points.size()]);
//}

PFont.Glyph[] getGlyphs(PFont font, String txt) {
  List<PFont.Glyph> result = new ArrayList<PFont.Glyph>();
  for (int i = 0; i < txt.length();i++) {
    char ch = txt.charAt(i);
    PFont.Glyph glyph = font.getGlyph(ch);
    result.add(glyph);
  }
  
  return result.toArray(new PFont.Glyph[result.size()]);
}

PVector[] textToPoints(String fontPath, String txt, float x, float y, float fontSize/*, options*/) {
  float xoff = 0;
  
  PFont font = createFont(fontPath, fontSize, true);
  List<PVector> result = new ArrayList<PVector>();
  PFont.Glyph[] glyphs = getGlyphs(font, txt);

  for (int i = 0; i < glyphs.length; i++) {
    //if (!isSpace(i)) {
      // fix to #1817, #2069

      Path gpath = glyphs[i].getPath(x, y, fontSize),
        paths = splitPaths(gpath.commands);

      for (var j = 0; j < paths.length; j++) {
        var pts = pathToPoints(paths[j], options);

        for (var k = 0; k < pts.length; k++) {
          pts[k].x += xoff;
          result.push(pts[k]);
        }
      }
    //}

    xoff += glyphs[i].advanceWidth * this._scale(fontSize);
  }

  return result;
};


void setup() {
  //font = loadFont("AvenirNextLTPro-Demi.otf");
  
  size(600, 300);
  background(51);
  // textFont(font);
  // textSize(192);
  // fill(255);
  // noStroke();
  // text('train', 100, 200);

  PVector[] points = textToPoints("AvenirNextLTPro-Demi.otf", "train", 100, 200, 192);

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
  translate(100, 200);
  for (int i = 0; i < vehicles.length; i++) {
    Vehicle v = vehicles[i];
    v.behaviors();
    v.update();
    v.show();
  }
}
