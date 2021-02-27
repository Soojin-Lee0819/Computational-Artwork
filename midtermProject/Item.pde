//class Item is for the items falling from the sky
class Item { 
  int itemCoordinatex, itemCoordinatey; // the coordinate of items
  int itemSize; // size of item
  int itemType; // identify type of item
  int itemSpeed; //how fast the items are falling
  boolean startgame=true;

  Item(int num) {
    itemType=num+1;
    itemCoordinatex=int(random(730)); //randomize position within the lenght of width
    itemCoordinatey=-50; //start falling from a little bit off frame
    itemSize= 70; //size of the item image
    itemSpeed=int(random(9, 20)); // randomize the speed of item falling
  }


  void display() {
    String Itemimgname="img/Item"+str(itemType)+".png";//generate img name for Item
    PImage Item;
    tint (255, 255); 
    if (startgame) {
      Item=loadImage(Itemimgname);
      image(Item, itemCoordinatex, itemCoordinatey, itemSize, itemSize); //load image for item
    };
  };

  //To start Item falling Action
  void fall() {
    itemCoordinatey=itemCoordinatey+itemSpeed;
  };
  
  //if item collides with ground animate it to restart from the sky 
  void collision() {
    if (itemCoordinatey>=height-70) { // if item collides with the ground height - item size
      itemCoordinatey=-100;// it goes back to the sky
      itemCoordinatex=int(random(70, 730)); //reset x position a nd speed
      itemSpeed=int(random(9, 20));
    };
  };

  //animate item disappear 
  void erase() {
    itemSpeed = 0;
    itemSize = 1;
  };
};
