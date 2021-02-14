# Assignment 4:Data visualization & Generative Text

## Title: Special Full-Course Dinner Reservation 

### Ideation:

Recently, I have been watching a TV show called Masterchef and I often imagine myslef becoming a star chec and opening a fine-dining restaurant. When I open the restaurant, instead of having a fixed menu choices, I want to have a system where the menu changes daily and customize it to individual customers. With this in mind, having learnt how to load data and display text on Processing, for this project I created a full-course dinner reservation system where users can input personal information to receive a personalized menu with five-course dishes are randomly selected from the loaded data. 

### Overall Concept:

This project generates a personalized five-course meal menu based on the input the users put. It is a simulation of making a reservation for a fine dining restaurant, where users input personal information like his/her name and date of reservation and receive an invitation card with the list of five-course meal menu that is determined randomly based on the different options listed in the table in the .csv file. The menu consists of: hours d'oeuvre, appetizer, salad, main, and dessert. If users are unsatisfied with the recommended menu or want to make another reservation, they can click a return button to reset and restart. 

### Final Product

Below is the gif file of the Soojin's Kitchen Reservation demonstration:

![alt-text](Images/reservationDemo.gif)


### Description & 

When the program runs, users land on the mainpage that introduces Chef Soojin and her restaurant "Soojin Lee Kitchen". I created an arbitrary restaurant for this projecet using my name, imagining that I am a star chef with my own restaurant. 

This page consists of three elements. An image of the elegent dish on top, word description of the restaurant in the middle, and a section where users type in their name and the date of reservation to make a reservation. 

Image of the landing page is attached below:

![alt-text](Images/mainpage.png)

Once Users have typed in their name, chose preferred date, and clicked Reserve Now Button, they will receive a WELCOME card that includes:

- The name of a person who made a reservation ("Welcome **name**)
- The date (Feb/**date**/2021)
- The list of five-course dishes randomly chosen from the table in the csv file. 

Image of the menu page is attached below:

![alt-text](Images/menupage.png)

This is an example of a reservation under a customer named Michael Shiloh on the date of Feburary 8th, 2021.

Users can have a look at the menu and if he/she is unhappy with the choice of dishes, they can click the return arrow button to return the the landing page and make another reservation, which will give different options for the dishes. 

### Challenges 

**Display user-input information**

To allow users to input information, I had to create an empty string and assign events to the keyboard, where the string value changes based on what key is pressed. I created two strings "name" and "date". For string "name" it inputs the value when alphabet keys are pressed while for the string "date", it inputs the value when the number keys are pressed. 

As the user type-in, it shows on the page and the data is restored and it is shown on the Menu page as well. 

**Display randomly chosen dishes from the csv.file**
Although we have covered how to pick up data from the csv. file and display values, since I was unfamiliar with data visualization and 
It uses the "Table" class to produce the string values from the.csv file. The file has a table with multiple columns and it randomly chooses a value (types of dishes). 

**Adding Images**

Since there are two pages, I wanted viewers to navigate through one 
Setting a Boolean for each Class

**Reverse/Delete**
In order to delete the text, I used substring 

**Assigning Keys**
I have assigned number keys to "day" and assigned alphabet keys to "name". 

**Icon**
I created a return icon on Figma. 

![alt-text](Images/arrow.jpg)

**Procedure**
I wanted to have a system where useres can only book when they have made an entry of their name and reservation date

**Reset and restart**
I wanted users to be able to make another reservation when users are not happy with the recommended dishes or if they want to make another booking.
It was difficult to find out how to 

### Interesting Lesson
I see the potential of 





