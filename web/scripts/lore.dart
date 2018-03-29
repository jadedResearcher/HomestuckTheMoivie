import 'dart:html';
import "TranscriptParser.dart";
import 'random.dart';
Element output;
void main() {
  //querySelector('#output').text = 'Your Dart app is running.';
  output = querySelector('#output');
  //TODO have it have the abililty to shuffle transcripts, too.
  int minNumber = 113;
  int maxNumber = 2;
  int number = minNumber + new Random().nextInt(maxNumber);
  //number = 5;
  //http://readmspa.org/transcripts/
  TranscriptParser.init(); //static vars don't exist till they do
  output.text = ("Script: $number");
  TranscriptParser.readTranscript("transcripts/$number.txt",output);
  storeCard("N4Igzg9grgTgxgUxALhAJQQQwCYAIASEAtgmAC5RwDWuZAFgrgLIQCWAbkgDQgB2mJFCCaYqjTLgDKdVmTIBPZm04geZBAA8yQ3BADuvBDAT8SMAORhcrGBF6s4uPQgBGcYg9wuE7klb2sADbYgYoADhBhUIGYMLiYvHgSLOysCAB0memacFBgjCRczADyAJIAagCiuADmCGRWRDiMEABm1mTpuAAqDIqxjLz6uGilAML4uACCAHIAIrgAYlNMxQCqkumqIC6Y1DW2UIkzAkioAOIQENgivGCsdulhvDXbZDCsNXUwY3QJiEIAAzpACs2zAiEMYG6EDWvECEGoQgA2gBdbbGMDRBqSMiYBoo4AAHT4pxJyBJyyYlRJXBJ7EwgSgCHJJIAjICSQBfIrE0kkVkgABMIIAbLgNLgRaLafTGczBdLubySaYWSgSWNikxqWgxjTVHKmeqKSAOdz0WoPl8jLj8WAADKkfIwFGWkDvT7fO0Nc7GfFGQmqska4ViiVSsWykAM42CtkWt7W714hqVACOUEZbpAXKAA");
}

void storeCard(String card) {
  String key = "LIFESIMFOUNDCARDS";
  if(window.localStorage.containsKey(key)) {
    String existing = window.localStorage[key];
    List<String> parts = existing.split(",");
    if(!parts.contains(card)) window.localStorage[key] = "$existing,$card";
  }else {
    window.localStorage[key] = card;
  }
}
