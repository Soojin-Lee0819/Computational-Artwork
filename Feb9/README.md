# Assignment 3:Object Oriented Programming

## Title: Underwater Foodchain 

For this week's assignment, following the instruction to corporate object oriented programming (OOP),arrays, and classes, I created an interactive animation piece using processing. 

This project is a cute animation of fish and Salmon swimming in the ocean, where Salmon, the big fish, eat small fish, and users can moderate this by either adding more Salmons in the ocean or getting rid of Salmons by cathcing Salmon.

I chose Salmon because it is my favorite fish and I love eating Salmon. However a few years ago, I came across the article about how inefficient it is for us to consume big fish like Salmon for the environment since they are on top of the food chain. Ever since then, when I eat Salmon, I cannot not think about all the small fish that I am eating indirectly by consuming Salmon. 

Although this lighthearted cute animation is nowhere near a realistic representation of the complex underwater foodchain, the general idea of big fish (Salmon) eating small fish, and us, human on top of the food chain eating Salmon is ideologically conveyed while users are interacting with this animation. 

This project includes three pde files in total; one main file that runs the function, and two class files "fish" and "salmon". File "fish" and "salmon" includes location, shape, movement, and interactivity of objects. 

Since this is a user interactive piece, I have demonstrated the final version of animation in the video below:

[![Watch the video](Image/salmoneatsfish.png)](https://youtu.be/HjzMetCymzY)

(This is the verbal explanation of how this interactive animation works)

1. There is a school of fish in the ocean with one Salmon 

2. Fish and Salmon moves around and Salmon eats fish

3. Users can click mouse to add more Salmons (User can add up to 4 salmons max)

4. Salmons in the sea continuously move around and eat fish


Users can not only create more Salmons but they can also catch Salmons by hovering mouse over the Salmon. 
I have demonstrated this when there is no more fish left in the ocean in the video below:

[![Watch the video](Image/catchsalmon.png)](https://youtu.be/U45Wx4rRSPU)


## Process & Challenges

Before I start coding, I explored preloaded Java Examples and Daniel Shiffman's contributed examples in Processing. 

I have studied some example codes on ArrayObjects. Incorporating this with what I have learnt in class on Feburary 4th, I started with creating an animation of fish positioned in an array that are floating around within its array box in randomized speed. 

**Creating Fish Animation**

[![Watch the video](Image/fisharray.png)](https://youtu.be/ahqS62cjVPs)

- There is one fish in each array unit 
- Create as many array as possible as long as it fits into the width and height
- Update fish with speed and random direction to make fish move around 
- Create function Check collision to make sure fish move around within its array box 
- If the x,y position of fish reaches the boundary of array box, it changes the direction by multiplying (-1) so fish always stays with the unit
- Draw fish using ellipse and triangle 


**Designing Salmon**

![](Image/salmondraw.jpg)

As shown in the image above, I first made a sketch of Salmon using simple shapes like triangle, rectangle and ellipse. 

When translating this to a script, i Coded everything based on the unit scale of Salmon body. For example, 

triangle(x+SALMONBODYSIZE/2, y+SALMONBODYSIZE/2, x+SALMONBODYSIZE/2, y-SALMONBODYSIZE/2, x+SALMONBODYSIZE+SALMONBODYSIZE/2, y); 

This way, when I want to change the scale of Salmon, I can simply change the SALMONBODYSIZE integer. 

**Creating Salmon Animation**
Similar to Fish, I made Salmon to move around by assigning x,y position for Salmon and updating it by adding speed to the x,y poition, which makes Salmon moves around. The difference is that for Salmon, it can move around anywhere within the frame so it only change directions when it reaches the border of the background. 

**Add Interactivity**
(Adding Salmon)
By default, there is one salmon in the animation. 
By clicking mouse, users can add more Salmon.
Salmon enters from randomized position. 
Users can add up to 4 Salmons and when it reaches the limit, the processor prints out a notification that there is no more salmon in the ocean.

![](Image/thereisnomore.png)

**Animation How to Erase Fish?**

I wanted Fish to disappear but I couldn't find 

**Color Random**
Originally I set color scale to random to have variety of fish in the ocean. However, instead of colors were changing every frame. I have tried. Therefore, I ended up having unified color; white. 





## Reflection/What's up next?
Working on this project, I built a solid understanding of array feature and classes in Processing. 
I want to make the animation more sophisticated by adding features such as moving Salmon's mouth, and make Salmon gets bigger as it eats fish. 
I also want to set a timer feature and turn this interactive animation into a game, where users have to catch all the fish within a time limit. 


