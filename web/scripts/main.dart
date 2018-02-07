import 'dart:html';
import "TranscriptParser.dart";
Element output;
void main() {
  //querySelector('#output').text = 'Your Dart app is running.';
  output = querySelector('#output');
  //TODO have it read a random transcript
  int maxNumber = 1;
  int number = 1;
  //http://readmspa.org/transcripts/
  TranscriptParser.init(); //static vars don't exist till they do
  TranscriptParser.readTranscript("transcripts/$number.txt",output);
}
