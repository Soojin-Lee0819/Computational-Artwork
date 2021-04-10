# Assignment 4:Data visualization & Generative Text

## Title: Special Full-Course Dinner Reservation 

### Ideation:

Recently, I have been watching a TV show called Masterchef. Watching Masterchef, I started to imagine myself being a star chef and opening a fine-dining restaurant. When I open the restaurant, instead of having a fixed menu, I want to have a system where the menu changes in daily bases to provide a more personal and customized experience for the customers. With this idea in mind, following the instruction to create a visualization or a generative text, for this project I created a full-course dinner reservation program where users can input their personal information to receive a personalized menu with five-course dishes that are are randomly selected from the csv data table.  

### Overall Concept:

This program creates a personalized five-course menu based on the input the users put. It is a simulation of making an online reservation for a fine dining restaurant. Users write down his/her name and the date of reservation, and receive an invitation card with the list of a five-course meal. The dinner consists of: hours d'oeuvre, appetizer, salad, main, and dessert, and everytime when the code runs, dishes are randomly selected from the different options listed in the csv file table. If users are unsatisfied with the presented menu or want to make another reservation, they can click a return button to reset, and restart the reservation process. 

### Final Product

Below is the gif file of the Soojin's Kitchen Reservation demonstration:

I have demonstrated making a reservation under the name of "Michael" and "Oliver".

Pay attention to how the dishes change for the two differnet reservations. 

![alt-text](Images/demo.gif)


### Description 

When the program runs, users land on the **cover page** that introduces Chef Soojin and her restaurant "Soojin Lee Kitchen". I created an arbitrary restaurant for this projecet using my name, imagining that I have a restaurant under my name :))  

The **Cover Page** consists of three elements. An image of the elegent dish on top, word description of the restaurant in the middle, and a section where users type in their name and the date of reservation to make a reservation. 

Image of the **Cover Page** is attached below:

![alt-text](Images/mainpage.png)

Once Users have typed in their name, chose preferred date, and click Reserve Now Button, they will receive a WELCOME card that includes:

- The name of a person who made a reservation ("Welcome **name**)
- The date (Feb/**date**/2021)
- The list of five-course dishes randomly chosen from the table in the csv file. 

Image of the menu page is attached below:

![alt-text](Images/menupage.png)

This is an example of a reservation under a customer named Michael Shiloh on the date of Feburary 8th, 2021.

Users can have a look at the menu and if he/she is unhappy with the menu, they can click the arrow button to return to the cover page and make another reservation, which will give a completely different dish options for their dinner course. 

### Process & Challenges & Interesting Lessons Learnt

**Display user-input information**

To allow users to input their names and date, I had to create two strings "name" and "day". I then assigned events to the keyboard in a way that when alphabet keys are pressed, the inputs are registered to the string "name", while when the the number keys are pressed the values are input to the string "day".
As the user type-in, the value shows on the coverpage, and their inputs are also shown on the Menu page as a text. 

**Display random dishes selected from the csv.file**

In class we have learnt how to import csv data and process it. However, since this is my first time processing data, everything was confusing in the beginnging that I didn't know where to start. Reading Daniel Shiffman's Tutorial on "Data and Manipulating Strings", I have revised the structure of data processing before I embarked on this project. Here is the summary of my revision:

1. Load data in Table
2. Create a string to the variables 
3. Import random variables from the table to the string
4. Display string in the form that you want (in this case, text)

I have created my own data, list of dishes, in the form of Table using excel. Once I have saved it as a csv cfile, on Processing, I created five strings; horsdoeuvre_c;, appetizer_c;, salad_c;, main_c;, dessert_c;. Each string represents a column of the table. I get data from the csv file like this **(String horsdoeuvre[] = table.getStringColumn("horsdoeuvre")** and put a random value between 0-6 **horsdoeuvre_c = horsdoeuvre[int(random(0, 6))];** to randomly choose a variable from the data. Finally, I displayed the data it in the form of text **(text(horsdoeuvre_c, 440, 295);)**

**Assigning Keys**

To enable users to input names and dates by typing-in information, I used void keyPressed and assigned keys to strings using if() statement. 
Since users are expected to input two different types of information; name and date, I have assigned number keys to the "day" string, and assigned alphabet keys to the "name" string. 

One small challenge I faced was finding the key name for space bar. I wanted to allow users to use spacebar to make a space between their first and last name but I couldn't find the appropriate name for this key. Later, I found out that there exists keyCode for the keys, such as keyCode == 32 represents a space bar. I also used Keycode as a shortcut to assign alphabets to name string. Instead of assigning each alphaet to name string individually, I used (keyCode >= 65 && keyCode <= 90) to assign all the alphabet keys. 

**Reverse/Delete (using substring)**

When users input the wrong information, I wanted them to use a backspace key to delete the input. It was a great challenge figuring out how to do this. I end up using substring to reduce the string length by one when the BACKSPACE key was pressed. 

One issue that I still need to figure out is learning how to individually assign BACKSPACE for the string "Name" and for the string "Day". I want to provide a delete function for both string "Name" and "date" but when both are assigned with BACKSPACE, everytime when user press BACKSPACE, it reduces .length for both Name and Day. Since this causes a lot of problem, I ended up dedicating BACKSPACE only for the string "name". Therefore, user can press backspace to erase "Name" but they cannot erase number to fix the date. 

**Creating a Button**

I created a button using voidmouseClicked(). When the mouse is clicked on the shape of the button, it activates the event. I used pintln (mouseX,mouseY) to measure the size and the positionoing of the button so that I set a value in a way that it only activates the mouseClick() event within the button shape. 

The event is operated using Boolean of setting true or false for the two classes; coverpave and menupage. Therefore, buttons are used to navigate through the two pages. When the button is pressed the draw function changes from true to false or from false to true. I initialized Boolean differently for each page so that when the coverpage is displayed, menupage is not displayed and vise versa. 

**After Event, Allow Second Event**

I wanted to have a system where useres can only press the reservation button after they have made an entry of their name and the date. Therefore, I have assigned mouseClicked() event to function only when the length. of the string name and day is bigger than zero. 

**Adding Images**

This was my first project adding images to the program. It was relatively a straightforward process and I have used tint(number value,number value) to adjust the transparency of the image.

**Icon**

I created an arrow icon to make a button that returns to the coverpage. I used the Figma (https://www.figma.com) page to design an icon. 

![alt-text](Images/arrow.jpg)

**Reset and restart**

I wanted users to be able to make another reservation when they are not happy with the recommended dishes or if they wish to make another reservation. The challenge was that when users click arrow button from the menupage to return to the coverpage, the entry they have made earlier are still visible on the coverpage. Also when they click "Reserve Now" button for the second time, instead of presenting them with anewed list of dishes, it shows the same variable choices from berfore since I did not set the code to run again. 

Therefore, I wanted to find a way that resets and re-run the code when the buttons are pressed. 

To solve this problem, I added **setup();** function to the mouseClicked event and added **name = name.substring(0, name.length()-name.length());** to delete all the previous entry that users have made. 





