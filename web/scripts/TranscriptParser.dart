import "Character.dart";
import 'dart:html';
import "path_utils.dart";

abstract class TranscriptParser {

    static Element output;

    //IMPORTANT: MAKE THESE ALL LOWER CASE
    static Character dave = new Character("images/dave.jpg","#ff0000", <String>["dave","tg","strider"]);
    static Character dirk = new Character("images/dirk.jpg","#f2a400", <String>["dirk","tt","strider"]);
    static Character jane = new Character("images/jane.jpg","#00d5fd", <String>["jane","gt","crocker"]);
    static Character roxy = new Character("images/roxy.png","#ff6ff2", <String>["roxy","tg","lalonde"]);
    static Character jake = new Character("images/jake.png","#1f9400", <String>["jake","gt","english"]);

    static List<Character> characters = <Character>[dave, dirk, jane, roxy, jake];


    static void readTranscript(String fileLocation, Element outputDiv) {
        /*
        dave.say("Boner", output);
        dirk.say("Boner", output);
        dave.say("it hella works or something probably i dunno", output);
        dirk.say("It would seem so.", output);
        jane.say("hoo", output);
        jake.say("tally ho!", output);
        roxy.say("*wonk*", output);
        */
        output = outputDiv;
        print("Trying to parse: $fileLocation");
        HttpRequest.getString(PathUtils.adjusted(fileLocation)).then(parseTranscript);


    }

    static void parseTranscript(String transcript) {
        //TODO parse it line by line
        //then look for lines that start with a known name
        //and print them out with that name
        List<String> parts = transcript.split("\n");
        print("Parts is ${parts.length} long.");
        for(String line in parts) {
            parseLine(line);
        }

        parseLine("Jane: Hello World Guvner.");

        //output.text = transcript;
    }

    static void parseLine(String text) {
        print("Parsing line: $text");
        List<String> parts = text.split(":");
        print(parts);
        if(parts.length <2) return;
        Character c = findCharacter(parts[0].trim());
        print("$c is going to say ${parts[1]}");
        if(c != null) c.say(parts[1], output);
    }

    static Character findCharacter(String text) {
        print("Looking for character $text");
        for(Character c in characters) {
            print("is ${c.tags} $text? ");
            if(c.tags.contains(text.toLowerCase())) return c;
        }
        return null;
    }
}

