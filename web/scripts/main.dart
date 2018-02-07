import 'dart:html';
import "TranscriptParser.dart";
import 'random.dart';
Element output;
void main() {
  //querySelector('#output').text = 'Your Dart app is running.';
  output = querySelector('#output');
  //TODO have it have the abililty to shuffle transcripts, too.
  int maxNumber = 10;
  int number = new Random().nextInt(maxNumber)+1;
  //number = 10;
  //http://readmspa.org/transcripts/
  TranscriptParser.init(); //static vars don't exist till they do
  output.text = ("Script: $number");
  TranscriptParser.readTranscript("transcripts/$number.txt",output);
}
