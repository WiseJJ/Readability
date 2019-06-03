import java.util.Scanner;
StringParser stringpars;
String text;
String [] words ;
String [] sentence ;
char [] characters ;
int bibleG;
int quranG;
int vedasG;
boolean b1;
boolean b2;
boolean b3;
PImage hBible;
PImage Qur;
PImage Ved;
void setup(){
  b1=true;
  b2 =true;
  b3 = true;
  size(900,600);
  background(98,98,98);
  words = loadStrings("theBible.txt");
 String txt1 = join(words, " ");
 stringpars = new StringParser(txt1);
 System.out.println("the holy bibles flesh reading level is... " +stringpars. getFlesch());
 System.out.println("this means the bibles is at a " +stringpars. gradeLevel()+ " grade reading level");
 bibleG =round((float)stringpars. gradeLevel());
 System.out.println(bibleG);
 words = loadStrings("theQuran.txt");
 txt1 = join(words, " ");
 stringpars = new StringParser(txt1);
 System.out.println("the quran's flesh reading level is... " +stringpars. getFlesch());
 System.out.println("this means the quran is at a " +stringpars. gradeLevel()+ " grade reading level");
 quranG =round((float)stringpars. gradeLevel());
 System.out.println(quranG);
 words = loadStrings("theVedas.txt");
 txt1 = join(words, " ");
 stringpars = new StringParser(txt1);
 System.out.println("the vedas's flesh reading level is... " +stringpars. getFlesch());
 System.out.println("this means the vedas is at a " +stringpars. gradeLevel()+ " grade reading level");
 vedasG =round((float)stringpars. gradeLevel());
 System.out.println(vedasG);
 hBible = loadImage("bible.png");
 Qur = loadImage("Qur.png");
 Ved = loadImage("ved.png");
}
void draw(){
  textSize(60);
  fill(141,120,80);
  text("Here is the reading levels of\n multible holy books!", 60,60);
  Qur.resize(170, 270);
  image(Qur,50,200);
  textSize(20);
  fill(141,120,80);
 text("  the quran is at a\n 4th grade reading level",50,500);
 
  Ved.resize(170, 270);
  image(Ved,350,200);
  textSize(20);
  fill(141,120,80);
 text("  the vedas are at a\n 4th grade reading level",350,500);
 
  hBible.resize(170, 270);
  image(hBible,650,200);
  textSize(20);
  fill(141,120,80);
 text("  the bible is at a\n 8th grade reading level",650,500);
}

public class StringParser {

  public StringParser() {
  }
  public StringParser(String txt) {
    text=txt;
    words = text.split("[\\,!\\s]+");
    sentence = text.split("[\\!.?]");
    characters = text.toCharArray();
   
  }

  /**
   *countWords();
   * A "word" is defined as a contiguous string of alphabetic characters
   * i.e. any upper or lower case characters a-z or A-Z.  This method completely 
   * ignores numbers when you count words, and assumes that the document/paragraph does not have 
   * any strings that combine numbers and letters. 
   */

  public int countWords() {

    return words.length;
  }

  public int countVowels() {
    int vowels=0;
    for (int i=0; i<characters.length; i++) {
      if (characters[i]=='a'||characters[i]=='e'||characters[i]=='i'||characters[i]=='o'||characters[i]=='u'||characters[i]=='y') {//could also make a for loop
        vowels++;
      }
    }
    return vowels;
  }
  /**
   * Get the total number of syllables in the document (the paragraph). 
   * To count the number of syllables in a word, use the following rules:
   *       Each contiguous sequence of one or more vowels is a syllable, 
   *       with the following exception: a lone "e" at the end of a word 
   *       is not considered a syllable unless the word has no other syllables. 
   *       You should consider y a vowel.
   */

  public int countException() {
    int except= 0;
    for ( int i =0; i<characters.length-1; i++) {
      if (characters[i] == 'a'||characters[i] == 'e'||characters[i]=='i'||characters[i]=='o'||characters[i]=='u'||characters[i]=='y') {
        if (characters[i+1] == 'a'||characters[i+1] == 'e'||characters[i+1]=='i'||characters[i+1]=='o'||characters[i+1]=='u'||characters[i+1]=='y')
          except++;
      }
    }

    for (int i = 0; i<characters.length-1; i++) {
      if (characters[i]=='e') {
        if (characters[i+1]==' ') {
          except++;
        }
      }
    }
    return except;
  }

  public int countSyllables() {
    return countVowels() - countException();
  }


  /**
   * Eventually write this one too. Get the number of sentences in the document/paragraph.
   * Sentences are defined as contiguous strings of characters ending in an 
   * end of sentence punctuation (. ! or ?) or the last contiguous set of 
   * characters in the document, even if they don't end with a punctuation mark.
   */

  public int countSentences() {
    String para =text; 

    String [] sentences = para.split("[.!?]");

    return sentences.length;
  }
  public double getFlesch()
  {
    double fle;
    fle= 206.835 -(1.015* countWords()/countSentences()) - (84.6 * countSyllables()/countWords());
    return fle;
  }

  public double gradeLevel()
  {
    double grade;
    grade = (.39* countWords()/countSentences()) + (11.8 * countSyllables()/countWords())-15.59;
    return grade;
  }
}