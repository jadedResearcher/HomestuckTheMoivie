import 'dart:html';
import "TranscriptParser.dart";
import 'random.dart';
Element output;
void main() {
  //querySelector('#output').text = 'Your Dart app is running.';
  output = querySelector('#output');
  //TODO have it have the abililty to shuffle transcripts, too.
  int maxNumber = 14;
  int number = new Random().nextInt(maxNumber)+1;
  //number = 5;
  //http://readmspa.org/transcripts/
  TranscriptParser.init(); //static vars don't exist till they do
  output.text = ("Script: $number");
  TranscriptParser.readTranscript("transcripts/$number.txt",output);
  storeCard("N4Igzg9grgTgxgUxALhAMQJYDsAmACACQgFsEwAXKOAazwBUALBPAWQgwDckAaELAQ1IoQAIQRwSzAJIwIWDHH4AbJQE88aQdDA8Q5BAA9ywvBADuWBDAQDSMAORg8GWfLh4zCAEYTiCvAz8Tl7ikh4YSjhqeAAOEDFQSvwwAHR4UuTOTljmePx4OjAYZKYAZnjEEBzFYCl1hnBQOhUIaSwA8lIAagCiAMppjAjqycxFcAx5uHilWk0pILxe-DQA5rJQuABygkioAOIQEDgs-FhgGHIpMViri3pFq6tWAMKBWIjCAAwpAKz3YEQljAdAgAFUsEoIDRhABtAC692sYES5DAfXI-DRcOAAB0+Lt8ch8QAmX4ANjwBjwZPJ+O4+I4yigCCJpIp+IAvtw8HiCaQ2egAIIsHr0xnM1kofEARi+XJ5fNsUuJIBe7RYooASi8xYsJUoWYK5VzEbxyI9njAMViwAAZMiFOFmh4YJ5WG1o-bWLFWHH45WCqQsIX7KRbIV0KTtLbikBMw0q2Wm+4Wt1Wz1gHoARygymdIE5QA");
}


void storeCard(String card) {
  print("deploying card");
  String key = "LIFESIMFOUNDCARDS";
  if(window.localStorage.containsKey(key)) {
    String existing = window.localStorage[key];
    List<String> parts = existing.split(",");
    if(!parts.contains(card)) window.localStorage[key] = "$existing,$card";
  }else {
    window.localStorage[key] = card;
  }
}