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
}
