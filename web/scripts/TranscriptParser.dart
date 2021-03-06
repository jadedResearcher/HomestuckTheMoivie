import "Character.dart";
import 'dart:html';
import "path_utils.dart";
//http://www.mspaintadventures.com/?search=6_1
//http://readmspa.org/transcripts/
abstract class TranscriptParser {

    static Element output;
    static List<Character> _characters = new List<Character>();

    static void addCharacter(Character c) {
        _characters.add(c);
        print("adding character $c to $_characters");
    }


    //IMPORTANT: MAKE THESE ALL LOWER CASE
    static Character myserty;


    static void init() {
        //just initing these adds them to list
         Character dave = new Character("images/dave.jpg","#ff0000", <String>["dave","tg","strider"]);
         Character dirk = new Character("images/dirk.jpg","#f2a400", <String>["dirk","tt","strider"]);
         Character jane = new Character("images/jane.jpg","#00d5fd", <String>["jane","gt","crocker","nanna"]);
         Character john = new Character("images/john.png","#0715CD", <String>["john","gt","egbert","popop","eb"]);
         Character roxy = new Character("images/roxy.png","#ff6ff2", <String>["roxy","tg","lalonde","mom"]);
         Character jake = new Character("images/jake.png","#1f9400", <String>["jake","gt","english","grandpa"]);
         Character jade = new Character("images/jade.png","#4AC925", <String>["jade","gg","harley","grandma"]);

         Character jude = new Character("images/jude.png","#4b4b4b", <String>["jude","fedorafreak"]); //game theory
         Character dad = new Character("images/dad.png","#c4c4c4", <String>["dad","pipefan413"]);
         new Character("images/erisol.jpg","#4ac925", <String>["erisol","erisolsprite"]);
         new Character("images/fefeta.jpg","#b536da", <String>["fefeta","fefetasprite"]);
         new Character("images/arquius.jpg","#ff0000", <String>["arquius","arquiusprite"]);

         new Character("images/aradia.jpg","#a10000", <String>["aradia","aa"]);
         new Character("images/tavros.jpg","#a15000", <String>["tavros","at"]);
         new Character("images/sollux.jpg","#a1a100", <String>["sollux","ta"]);
         new Character("images/karkat.jpg","#626262", <String>["karkat","cg",'fcg','pcg']);
         new Character("images/nepeta.jpg","#416600", <String>["nepeta","ac"]);
         new Character("images/kanaya.jpg","#008141", <String>["kanaya","ga",'pga','fga']);
         new Character("images/terezi.jpg","#008282", <String>["terezi","gc"]);
         new Character("images/vriska.jpg","#005682", <String>["vriska","ag"]);
         new Character("images/equius.jpg","#000056", <String>["equius","ct"]);
         new Character("images/gamzee.jpg","#2b0057", <String>["gamzee","tc"]);
         new Character("images/eridan.jpg","#6a006a", <String>["eridan","ca"]);
         new Character("images/feferi.png","#77003c", <String>["feferi","cc"]);

         new Character("images/caliborn.jpg","#323232", <String>["caliborn","uu"]);
         new Character("images/calliope.jpg","#929292", <String>["calliope","uu"]);

         new Character("images/jr.png","#3da35a", <String>["jr"]);
         new Character("images/ab.png","#ff0000", <String>["ab"]);
         new Character("images/kr.png","#9630BF", <String>["kr"]);

         myserty = new Character("images/myserty.png","#c4c4c4", <String>[]);
    }



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
       // print("Trying to parse: $fileLocation, characters are $_characters");
        HttpRequest.getString(PathUtils.adjusted(fileLocation)).then(parseTranscript);


    }

    static void parseTranscript(String transcript) {
        //TODO parse it line by line
        //then look for lines that start with a known name
        //and print them out with that name
        List<String> parts = transcript.split("\n");
        //print("Parts is ${parts.length} long.");
        for(String line in parts) {
            parseLine(line);
        }
        //output.text = transcript;
    }

    static void parseLine(String text) {
        //print("Parsing line: $text");
        List<String> parts = text.split(":");
        //print(parts);
        if(parts.length <2) return;
        Character c = findCharacter(parts[0].trim());
        //print("$c is going to say ${parts[1]}");
        parts.remove(parts[0]);
        if(c != null) c.say( "${parts.join(':')}", output);
    }

    static Character findCharacter(String text) {
        //print("Looking for character $text");
        for(Character c in _characters) {
            //print("is ${c.tags} $text? ");
            if(c.tags.contains(text.toLowerCase())) return c;
        }
        return myserty;
    }
}

