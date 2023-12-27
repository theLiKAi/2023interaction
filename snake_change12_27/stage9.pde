void errortext()
{
  String partialMessage1 = message.substring(0, currentLength1);
      textSize(30);
      text(partialMessage1, 300, 250);
      text(partialMessage1, 300, 100);
        if (currentLength1< message.length()) 
        {
           currentLength1++;
                    }
 String partialMessage2 = error1.substring(0, currentLength2);
      textSize(48);
      text(partialMessage2, 90, 650); 
      text(partialMessage2, 90, 350); 
        if (currentLength2< error1.length()) 
        {
           currentLength2++;
                    }
 
 String partialMessage3 = error2.substring(0, currentLength3);
      textSize(48);
      text(partialMessage3, 125, 725); 
      text(partialMessage3, 125, 10);
        if (currentLength3< error2.length()) 
        {
           currentLength3++;
                    }
 
 String partialMessage4 = error3.substring(0, currentLength4);
      textSize(48);
      text(partialMessage4, 0, 650);
      text(partialMessage4, 0, 150);
      text(partialMessage4, 0, 400);
        if (currentLength4< error3.length()) 
        {
           currentLength4++;
                    }
 
 
 String partialMessage5 = error4.substring(0, currentLength5);
      textSize(48);
      fill(#FA0000);
      text(partialMessage5, 400, 725);
      text(partialMessage5, 400,  500); 
      text(partialMessage5, 400,  200); 
      text(partialMessage5, 400,  600);
        if (currentLength5< error4.length()) 
        {
           currentLength5++;
                    }
  String partialMessage6 = typing.substring(0, currentLength6);
      textSize(40);
      text(partialMessage6, 400, 725); 
      text(partialMessage6, 400, 200);
        if (currentLength6< typing.length()) 
        {
           currentLength6++;
                    }                   
}
 
 
 
 
