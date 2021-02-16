import processing.core.PApplet;

public class Sketch extends PApplet {
public void setup() {
  String[] lines = loadStrings("words.txt");
  System.out.println("there are " + lines.length + " lines");
  for (int i = 0 ; i < lines.length; i++) 
  {
    System.out.println(pigLatin(lines[i]));
  }
}

public int findFirstVowel(String word){
  for (int i = 0; i < word.length(); i++)
  if (word.charAt(i) == 'a'|| word.charAt(i) == 'e'|| word.charAt(i) == 'i' || word.charAt(i) == 'o' || word.charAt(i) == 'u') {
    return i;
  } 
  return -1;
}

public String pigLatin(String sWord) {
//precondition: sWord is a valid String of length greater than 0
//postcondition: returns the pig latin equivalent of sWord
  if(findFirstVowel(sWord) == -1) {
    //For words that are all consonants, simply add "ay" to the end of the word.
    return sWord + "ay";
  } else if (findFirstVowel(sWord) == 0) {
    //For words that begin with vowels, simply add "way" to the end of the word.
      return sWord + "way";
  } else if (findFirstVowel(sWord) > 0) {
    //For words that begin with consonants, move the leading consonant(s) to the end of the word and add "ay." 
    return sWord.substring(findFirstVowel(sWord), sWord.length()) + sWord.substring(0, findFirstVowel(sWord)) + "ay";
  } else if (sWord.substring(0, 2) == "qu"){
    //For words beginning with "qu," move the "qu" to the end of the word and add ay.
    return sWord.substring(2, sWord.length()) + "quay";
  } else {
    return "ERROR.";
  }
  }
}
