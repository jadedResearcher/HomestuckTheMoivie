import 'dart:html';
import 'TranscriptParser.dart';
class Character {

    String textColor;
    String avatarLocation;
    //Karkat, Vantas, CCG, CG, PCG, FCG, etc.
    List<String> tags;

    Character(String this.avatarLocation, String this.textColor, List<String> this.tags) {
        TranscriptParser.addCharacter(this);
    }

    void say(String words, Element div) {
        //print("$tags is going to say $words");

        Element line = new DivElement();
        line.style.color = textColor;
        line.text = words;

        ImageElement  avatar = new ImageElement(src: avatarLocation);

        SpanElement container = new SpanElement();
        container.append(avatar);
        container.append(line);

        div.append(container);
    }


}