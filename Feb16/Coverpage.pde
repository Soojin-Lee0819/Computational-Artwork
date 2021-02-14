//Class Coverpage Start 
class Coverpage {
 
  void drawCover(){
    //image of the michelin star restaurant dish
    tint(255, 255);
    image(coverpage, 0, 0, 500, 300); // Source from https://www.amny.com/eat-and-drink/nyc-boasts-75-michelin-starred-eateries-in-2020-guide/
    
    //Title of the restaurant I created a fictional restaurant titled after my name 
    //use \n to separate the line
    textAlign(LEFT);
    fill(255);
    textFont (CharterRoman48, 30);
    text ("Soojin Lee \nKitchen", 60, 370);
    
    //Introduce the restaurant and the cuisine 
    textFont (Kokonor48, 15);
    text ("Chef Soojin Lee brings her culinary expertise to Abu Dhabi.\nExperience the innovative and artistic cuisine for Feburary.\nWrite your name and select a date to make a reservation.\nChef Soojin will offer a special cuisine just for you!", 60, 450);
    
    //Name and Date 
    textFont (CharterRoman48, 15);
    textAlign(LEFT);
    text ("Your Name:\n\n         Date:",100, 600);
    
    //Users fill their names using keyboard
    textFont (SnellRoundhand, 22); 
    text (name, 200, 600);
    
    //Users fill their liking date using keyboard
    textFont (CharterRoman48, 15);
    text ("Feb / "+day+" / 2021", 200, 640);
    
    //Reserve Now Button
    textAlign(CENTER);
    textFont (CharterRoman48, 14);
    fill(255);
    strokeWeight(2);
    rect(350, 680, 100, 30, 30);
    fill(0);
    textFont (CharterRoman48, 12);
    text("RESERVE NOW", 400, 700);
    
  }
}
//end of class CoverPage
