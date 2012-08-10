/* This script and many more are available free online at
The JavaScript Source :: http://javascript.internet.com
Created by: Jay M. Rumsey, OD :: http://www.nova.edu/~rumsey
 */

var num=0;

imgArray = [
  ['images/puppy17.gif','information', 'OK. What what do you want now?'],
  ['images/puppy18.gif','interference','I am planning on growing into my skin.'],
  ['images/puppy20.gif','message','Do you think my head is too big?'],
  ['images/puppy21.gif','information', 'This will be one of my small toys soon'],
  ['images/puppy23.gif','interference','Is that food over there?'],
  ['images/puppy30.gif','message','I only look sad.'],
  ['images/puppy31.gif','information', 'Can I get down now?'],
  ['images/puppy33.gif','interference','Enjoy youself.  I will pick you up later.'],
  ['images/puppy34.gif','message','Is this photo shoot almost over']
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


