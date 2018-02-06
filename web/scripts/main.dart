import 'dart:html';
import "TranscriptParser.dart";
Element output;
void main() {
  //querySelector('#output').text = 'Your Dart app is running.';
  output = querySelector('#output');
  //TODO have it read a random transcript
  int number = 1;
  TranscriptParser.readTranscript("transcripts/$number.txt",output);
}
