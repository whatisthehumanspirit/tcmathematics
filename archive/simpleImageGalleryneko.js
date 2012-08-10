/* This script and many more are available free online at
The JavaScript Source :: http://javascript.internet.com
Created by: Jay M. Rumsey, OD :: http://www.nova.edu/~rumsey
 */

var num=0;

imgArray = [
  ['images/IMG_0048.JPG','information', 'Get the robber: Beware of Cat!!'],
  ['images/IMG_0099.JPG','interference','When not climbing walls, doors will do.'],
  ['images/IMG_0102.JPG','message','There, now I can see!'],
  ['images/IMG_0169.JPG','information', 'Curiousity gets the cat a bath'],
  ['images/IMG_0110.JPG','interference','I must remember this next time I want to check out the bath tub.'],
  ['images/IMG_0125.JPG','message','You cannot find me.'],
  ['images/IMG_0171.JPG','information', 'Let me know when the Seahawks scout calls.'],
  ['images/IMG_0108.JPG','interference','Tired and being sweet for once.']
]

function slideshow(slide_num) {
  document.getElementById('mypic').src=imgArray[slide_num][0];
  document.getElementById('mypic').alt=imgArray[slide_num][1];
  document.getElementById('burns').innerHTML=imgArray[slide_num][2];
}

function slideshowUp() {
  num++;
  num = num % imgArray.length;
  slideshow(num);
}

function slideshowBack() {
  num--;
  if (num < 0) {num=imgArray.length-1;}
  num = num % imgArray.length;
  slideshow(num);
}


