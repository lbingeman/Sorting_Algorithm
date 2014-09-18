int terms = 100; //number of terms
int [] theNumbers = new int[terms]; //creating an array for the different heights of the array
int p = 0; //initializing variable p (used to determine sorting) 
int g = 0; //initializing variable g (used to determine sorting)
int counter = 0; //initializing counter used for creating array for height
int timeDelay = 10; //millisecond time delay
int lastTime = 0; //intializing variable lastTime
boolean timeChecker = false; //initializing timeChecker used to check the time for the timer delay
PFont f;  //declare the font
int z = 0; //intializing variable z
boolean finish = false; //initalizing finish, boolean used for checking whether program should finish
int repeatFunction = 0; //initalizing variable for repeatFunction 
void setup() {  // setup() runs once
  size(640,360); //declare screen size
  f = createFont("Arial",74,true); //create new font
  frameRate(50000); //declare frame rate
   int minHeight = int(height*0.05); //declare min height for bars
   int maxHeight = int(height - height*0.05); //declare max height for bars
  for(int i= minHeight; counter < terms; i = i + (maxHeight/terms)) { //creates an array of values for for height increasing in a constant manner 
     theNumbers[counter] = i; 
      counter = counter + 1; 
     // println(theNumbers[i] + " " + counter); 
   }   
   for( int i = 0; i < terms; i++) { //randomizes the values in the array so it is able to sort
     int random1 = int(random(terms)); 
     int random2 = int(random(terms)); 
     int temp = theNumbers[random1];
     theNumbers[random1] = theNumbers[random2]; 
     theNumbers[random2] = temp;  
   }
}

void draw() //runs continuously 
{ 
  background(0); 
  if(p < (terms-1)) { //if variable p is less than the number of terms it will run the function to sort and draw  
 for(g = g; g < terms; g++) { //g starts at 0, will compare each variable to p and switch is larger
    println("g is at " + g); 
  if(theNumbers[p] > theNumbers[g]) { //switchs the two if the height at p is greater than the height at g
    int temp = theNumbers[g];
    theNumbers[g] = theNumbers[p];
    theNumbers[p] = temp;
    println(theNumbers[g] + " is now element g " + g);
    println(theNumbers[p] + " is now element p" + p);  
  } 
  for (int i=0;i<terms;i++){ //function used to determine fill 
      if(i == p || i == g) { //will fill i with red if it is p or g
        fill(255,145,10); //fill red
      }
      else { //fills a random colour
        fill(128,37,227);
      }
      rectangleDraw(i); //calls draw rectangle function 
    }  
}
 g = 0; //sets g to 0
  }
 if(p < (terms-1)) { //if terms still needs to be checked it will increase p to the next term
 p = p + 1; 
 }
 else if(p <= (terms-1) && finish == false ){ //if p is equal to the terms (as the first if statement won't run) it will run the colour fill for the rest
   frameRate(10); //slow down framerate
   lastTime = millis(); //sets the last time to the current time
   println(lastTime + "  The last time   " +  millis() + "   millis"); //error report
    while(timeChecker == false && z < terms) { 
    if((millis() - lastTime) >= timeDelay) { //if the time since less run is greater or equal to time delay
           println("I've run");  //error report
           timeChecker = true; //set timeChecker to true so the draw rectangle loop will run
       }
    }
    if(timeChecker == true && z < terms) { //if time checker is true and if z (current position) is less than the number of terms
         drawRectangle(z); //draws the boxes changing colour
         drawRectangleOther(0,z);//draws all other boxes  
         z = z + 1; //adds one to position of terms
         lastTime = millis(); //resets the last time as current time
         timeChecker = false; //turn time checker to false
      }
    if(z >= terms) { //if z is equal to terms
     finish = true; // sets finish to true so this statement does not run
    }
}
else { //if finish is true it will run this final function
  repeatFunction = repeatFunction + 1;
  frameRate(1);  
  textFont(f,74);                 // STEP 4 Specify font to be used
   fill(95,206,255);      // STEP 5 Specify font color 
   if(repeatFunction == 1) {
   text("I win.",width/4,height/6);  // STEP 6 Display Text
   }
   if(repeatFunction == 2) {
   text("No... I win.",width/4,height/6);  // STEP 6 Display Text
   }
   if(repeatFunction == 3) {
   text("I am the bomb.",width/8,height/6);  // STEP 6 Display Text
   }
   if(repeatFunction >= 4) {
   frameRate(1000); 
   text("Wahooooo.",width/4,height/6);  // STEP 6 Display Text
   }
   println("I've done this"); 
   //draws shapes 
  fill(101,10,193);
  pushMatrix();
  translate(width*0.2, height*0.5);
  rotate(frameCount / 200.0);
  star(0, 0, 50, 70, 15); 
  popMatrix();
  fill(114,245,128);
  pushMatrix();
  translate(width*0.5, height*0.5);
  rotate(frameCount / 50.0);
  star(0, 0, 80, 100, 40); 
  popMatrix();
  fill(255,35,15);
  pushMatrix();
  translate(width*0.8, height*0.5);
  rotate(frameCount / -100.0);
  star(0, 0, 30, 70, 34); 
  popMatrix();

}
}
void drawRectangle(int h) { //recursion function for making the boxs turn blue
     fill(250,10,138); 
     rectangleDraw(h); 
     int d = h; 
     if(d > 0) {  
     d = d - 1;   
     drawRectangle(d);  
     }
}

void drawRectangleOther(int h, int j) { //function to ensure the rest of the rectangles are drawn even if not being turned blue at the end
     fill(126,19,214); 
     rectangleDraw(terms-1-h); 
     if((terms-1) - h  > j) {
       drawRectangleOther(h + 1, j);   
     } 
}

void rectangleDraw(int h) { //draws a rectangle
  float point = map(h,0, (terms-1), 0, width);  
  rect((point + ((width/terms)/8)),height-theNumbers[h],((width/terms)/(8/6)),theNumbers[h]); // draw a rectangle of (x position, top y position, width, height)
}

void star(float x, float y, float radius1, float radius2, int npoints) { //draws random star like shapes
  float angle = TWO_PI / npoints;
  float halfAngle = angle/2.0;
  beginShape();
  for (float a = 0; a < TWO_PI; a += angle) {
    float sx = x + cos(a) * radius2;
    float sy = y + sin(a) * radius2;
    vertex(sx, sy);
    sx = x + cos(a+halfAngle) * radius1;
    sy = y + sin(a+halfAngle) * radius1;
    vertex(sx, sy);
  }
  endShape(CLOSE);
}




