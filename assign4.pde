//You should implement your assign2 here.
final int GAME_START = 0;
final int GAME_RUN = 1;
final int GAME_OVER = 2;

int enemystate;
final int c=0;
final int b=1;
final int a=2;

PImage[]flames=new PImage[5];;
int curFlame=1;
int j;
boolean[]imgEnemy;
int[]aEnemyX = {-360, -295, -295, -230, -230, -165, -165, -100};
int[]bEnemyX = {-100, -165, -230, -295, -360};
int[]cEnemyX = {-100, -170, -235, -300, -365}; 
int e3Y=floor(random(0,175));
int[]aEnemyY = {e3Y+120, e3Y+60, e3Y+180, e3Y, e3Y+240, e3Y+60, e3Y+180, e3Y+120};
int e2Y=floor(random(0,160));
int[]bEnemyY = {e2Y, e2Y+60, e2Y+120, e2Y+180, e2Y+240};



PImage bg1,bg2,hp,fighter,treasure,enemy;
PImage start1,start2,end1,end2;

int treasureX,treasureY,fighterX,fighterY,enemyX,enemyY;
float m,q; //hp & background

int gameState;

boolean upPressed = false;
boolean downPressed = false;
boolean leftPressed = false;
boolean rightPressed = false;

int speed=5;


void setup () {
  size(640, 480) ;

  bg1 =loadImage("img/bg1.png");
  bg2 =loadImage("img/bg2.png");
  hp =loadImage("img/hp.png");
  fighter =loadImage("img/fighter.png");
  treasure =loadImage("img/treasure.png");
  enemy =loadImage("img/enemy.png");
  start1=loadImage("img/start1.png");
  start2=loadImage("img/start2.png");
  end1=loadImage("img/end1.png");
  end2=loadImage("img/end2.png");
  
  treasureX=floor(random(600)); //treasure
  treasureY=floor(random(440));
  
  //enemyX=-40;
  enemyY=floor(random(30,415)); //enemy  
  
  
  m=39; //hp
  
  fighterX=550; //fighter
  fighterY=height/2;
  
  for(int i=1;i<6;i++){
   flames[i-1]=loadImage("img/flame"+i+".png"); 
  }

  
  frameRate(60);
}
  
void draw() {
  
   switch(gameState){
     
    case GAME_START:
    //mouse action
    image(start2,0,0);
    if (mouseX>210 && mouseX<430 && mouseY>380 && mouseY<425){        
      if(mousePressed){
        //click
        gameState=GAME_RUN;
      }else{
        image(start1,0,0);
      }
     }     
      break;
       
       
    case GAME_RUN:
      //background
      image(bg1,q%1280-640,0); 
      image(bg2,(q+640)%1280-640,0);
      q++;
      
      //hp
      fill(230,0,0); 
      rect(28,27,m,23);
      image(hp,20,20); 
      
      //fighter
      image(fighter,fighterX,fighterY); 
      
      //treasure
      image(treasure,treasureX,treasureY); 
      
      //enemy
      switch(enemystate){
        case c:
          for(int i=0;i<cEnemyX.length;i++){
            
            image(enemy,cEnemyX[i],enemyY);                       
            cEnemyX[i]+=3;                               
           
           if(i==0){
             if(cEnemyX[i]>=fighterX-30 && cEnemyX[i]<=fighterX+30 && enemyY>=fighterY-40 && enemyY<=fighterY+40){
             cEnemyX[i]=800;m-=39;
            }}
           if(i==1){
             if(cEnemyX[i]>=fighterX-30 && cEnemyX[i]<=fighterX+30 && enemyY>=fighterY-40 && enemyY<=fighterY+40){
           cEnemyX[i]=800; m-=39;
           }}
           if(i==2){
             if(cEnemyX[i]>=fighterX-30 && cEnemyX[i]<=fighterX+30 && enemyY>=fighterY-40 && enemyY<=fighterY+40){
           cEnemyX[i]=800; m-=39;
           }}
           if(i==3){
             if(cEnemyX[i]>=fighterX-30 && cEnemyX[i]<=fighterX+30 && enemyY>=fighterY-40 && enemyY<=fighterY+40){
           cEnemyX[i]=800; m-=39;
           }}
           if(i==4){
             if(cEnemyX[i]>=fighterX-30 && cEnemyX[i]<=fighterX+30 && enemyY>=fighterY-40 && enemyY<=fighterY+40){
           cEnemyX[i]=800; m-=39;
           }}
           
                //cEnemyX[i]=1000;
                //cEnemyY[i]=1000;
                //image(enemy,cEnemyX[i],cEnemyY[i]);
                
              //  j=(curFlame++)%5;                              
               //image(flames[j],cEnemyX[i],cEnemyY[i]);               
               // m-=39;
            
            if(m<=0){
            gameState=GAME_OVER;
            }
           }                      
            
           if(cEnemyX[0]>1600){
              enemystate=b;
              bEnemyX[0]=-100; bEnemyX[1]=-165; bEnemyX[2]=-230; bEnemyX[3]=-295; bEnemyX[4]=-360;
              bEnemyY[0]=e2Y; bEnemyY[1]=e2Y+60; bEnemyY[2]=e2Y+120;  bEnemyY[3]=e2Y+180;  bEnemyY[4]=e2Y+240; 
              e2Y=floor(random(5,160));
            }
          
          
          
        break;
      
       case b:    
          for(int i=0;i<bEnemyX.length;i++){
            
            image(enemy,bEnemyX[i],bEnemyY[i]);
            bEnemyX[i]+=3;
            
            if(i==0){
              if(bEnemyX[i]>=fighterX-30 && bEnemyX[i]<=fighterX+30 && bEnemyY[i]>=fighterY-40 && bEnemyY[i]<=fighterY+40 ){
             bEnemyX[i]=800; m-=39;
            }} 
            if(i==1){
              if(bEnemyX[i]>=fighterX-30 && bEnemyX[i]<=fighterX+30 && bEnemyY[i]>=fighterY-40 && bEnemyY[i]<=fighterY+40 ){
             bEnemyX[i]=800; m-=39;
            }}
            if(i==2){
              if(bEnemyX[i]>=fighterX-30 && bEnemyX[i]<=fighterX+30 && bEnemyY[i]>=fighterY-40 && bEnemyY[i]<=fighterY+40 ){
             bEnemyX[i]=800; m-=39;
            }}
            if(i==3){
              if(bEnemyX[i]>=fighterX-30 && bEnemyX[i]<=fighterX+30 && bEnemyY[i]>=fighterY-40 && bEnemyY[i]<=fighterY+40 ){
             bEnemyX[i]=800; m-=39;
            }}
            if(i==4){
              if(bEnemyX[i]>=fighterX-30 && bEnemyX[i]<=fighterX+30 && bEnemyY[i]>=fighterY-40 && bEnemyY[i]<=fighterY+40 ){
             bEnemyX[i]=800; m-=39;
            }} 
            // j=(curFlame++)%5;            
             //image(flames[j],bEnemyX[i],bEnemyY[i]); 
            // m-=39;
            if(bEnemyX[0]>1600){
              enemystate=a;
              aEnemyX[0]=-360; 
              aEnemyX[1]=-295; aEnemyX[2]=-295; 
              aEnemyX[3]=-230; aEnemyX[4]=-230; 
              aEnemyX[5]=-165; aEnemyX[6]=-165; 
              aEnemyX[7]=-100;
             ///ENEMY3_Y///
              e3Y=floor(random(1,175));
              aEnemyY[0]=e3Y+120; 
              aEnemyY[1]=e3Y+60; aEnemyY[2]=e3Y+180; 
              aEnemyY[3]=e3Y; aEnemyY[4]=e3Y+240; 
              aEnemyY[5]=e3Y+60; aEnemyY[6]=e3Y+180; 
              aEnemyY[7]=e3Y+120; 
            }        

            if(m<=0){
            gameState=GAME_OVER;
            }
           }
          
       break;
      
       case a:
       image(enemy,aEnemyX[0],aEnemyY[0]);
       image(enemy,aEnemyX[1],aEnemyY[1]);image(enemy,aEnemyX[2],aEnemyY[2]);
       image(enemy,aEnemyX[3],aEnemyY[3]);image(enemy,aEnemyX[4],aEnemyY[4]);
       image(enemy,aEnemyX[5],aEnemyY[5]);image(enemy,aEnemyX[6],aEnemyY[6]);
       image(enemy,aEnemyX[7],aEnemyY[7]);

        for(int i=0;i<8;i++){
         
         aEnemyX[i]+=3;
        
          
          if(i==0){
            if(aEnemyX[i]>=fighterX-30 && aEnemyX[i]<=fighterX+30 && aEnemyY[i]>=fighterY-40 && aEnemyY[i]<=fighterY+40 ){           
             aEnemyX[i]=800; m-=39;
            }}
          if(i==1){
            if(aEnemyX[i]>=fighterX-30 && aEnemyX[i]<=fighterX+30 && aEnemyY[i]>=fighterY-40 && aEnemyY[i]<=fighterY+40 ){           
             aEnemyX[i]=800; m-=39;
            }}
          if(i==2){
            if(aEnemyX[i]>=fighterX-30 && aEnemyX[i]<=fighterX+30 && aEnemyY[i]>=fighterY-40 && aEnemyY[i]<=fighterY+40 ){           
             aEnemyX[i]=800; m-=39;
            }}
          if(i==3){
            if(aEnemyX[i]>=fighterX-30 && aEnemyX[i]<=fighterX+30 && aEnemyY[i]>=fighterY-40 && aEnemyY[i]<=fighterY+40 ){           
             aEnemyX[i]=800; m-=39;
            }}
          if(i==4){
            if(aEnemyX[i]>=fighterX-30 && aEnemyX[i]<=fighterX+30 && aEnemyY[i]>=fighterY-40 && aEnemyY[i]<=fighterY+40 ){           
             aEnemyX[i]=800; m-=39;
            }}
          if(i==5){
            if(aEnemyX[i]>=fighterX-30 && aEnemyX[i]<=fighterX+30 && aEnemyY[i]>=fighterY-40 && aEnemyY[i]<=fighterY+40 ){           
             aEnemyX[i]=800; m-=39;
            }}
          if(i==6){
            if(aEnemyX[i]>=fighterX-30 && aEnemyX[i]<=fighterX+30 && aEnemyY[i]>=fighterY-40 && aEnemyY[i]<=fighterY+40 ){           
             aEnemyX[i]=800; m-=39;
            }}
          if(i==7){
            if(aEnemyX[i]>=fighterX-30 && aEnemyX[i]<=fighterX+30 && aEnemyY[i]>=fighterY-40 && aEnemyY[i]<=fighterY+40 ){           
             aEnemyX[i]=800; m-=39;
            }}
          
            // j=(curFlame++)%5;                         
            // image(flames[j],aEnemyX[i],aEnemyY1[i]); 
            // m-=39;  
          if(m<=0){
            gameState=GAME_OVER;
          }
          if(aEnemyX[0]>1600){
          enemystate=c;
          cEnemyX[0] = -100; cEnemyX[1] = -165; cEnemyX[2] = -230; cEnemyX[3] = -295; cEnemyX[4] = -360; 
          enemyY=floor(random(5,415)); 
         }
         
           }
                    
         break;
        
        
      }     
      
      //treasure detection
      if(treasureX>=fighterX-50 && treasureX<=fighterX+50 && treasureY>=fighterY-50 && treasureY<=fighterY+50 ){
        treasureX=floor(random(600)); 
        treasureY=floor(random(440));
        m+=19.5;
       if(m>=195){
        m=195;
       }
      }
      
      //enemy detection
      
       /*for(int i=0;i<5;i++){
        
           if(cEnemyX[i]>=fighterX-30 && cEnemyX[i]<=fighterX+30 && cEnemyY[i]>=fighterY-40 && cEnemyY[i]<=fighterY+40 ){
                //cEnemyX[i]=1000;
                //cEnemyY[i]=1000;
                //image(enemy,cEnemyX[i],cEnemyY[i]);
                
                j=(curFlame++)%5;                              
               image(flames[j],cEnemyX[i],cEnemyY[i]);               
               // m-=39;
            }
            if(m<=0){
            gameState=GAME_OVER;
            } */
            
            /*if ( abs((fighterX+51.0/2)-(cEnemyX[i]+61.0/2)) <= 56 && 
              abs((fighterY+51.0/2)-(cEnemyY[i]+61.0/2)) <= 56){
            //hpX = hpX - (205-10)*20/100; 
            cEnemyX[1] = (0-640*2-61*5*3) - (640-cEnemyX[1]);
         }
       }*/
     /* if(enemyX>=fighterX-30 && enemyX<=fighterX+30 && enemyY>=fighterY-40 && enemyY<=fighterY+40 ){
        enemyX=0;
        enemyY=floor(random(30,440));
        m-=39;
        if(m<=0){
        gameState=GAME_OVER;
        }
      }
      
      //enemy chasing
      if (enemyY>=fighterY+25.5){
          enemyY-=3;
        }
      if (enemyY<=fighterY-25.5){
          enemyY+=3;
        }*/
      
      //boundary detection
      if (fighterX>585){
        fighterX=585;
      }
      if (fighterX<0){
        fighterX=0;
      }
      if (fighterY>425){
        fighterY=425;
      }
      if (fighterY<5){
        fighterY=5;
      }      
      
      
      if (upPressed) {
        fighterY -= speed;
      }
      if (downPressed) {
        fighterY += speed;
      }
      if (leftPressed) {
        fighterX -= speed;
      }
      if (rightPressed) {
        fighterX += speed;
      }
         
      break;
      
    
    case GAME_OVER:
      // mouse action
      image(end2,0,0);
      if (mouseX>210 && mouseX<420 && mouseY>310 && mouseY<350){
        if (mousePressed){
          // click
          gameState = GAME_RUN;
          enemystate = c;
          cEnemyX[0] = -100; cEnemyX[1] = -165; cEnemyX[2] = -230; cEnemyX[3] = -295; cEnemyX[4] = -360;       
          enemyY=floor(random(30,440));
          m=39;
        }else{
          image(end1,0,0);          
        }
      }      
      break;     
  }
    
}

void keyPressed(){
  if (key == CODED) { // detect special keys 
    switch (keyCode) {
      case UP:
        upPressed = true;
        break;
      case DOWN:
        downPressed = true;
        break;
      case LEFT:
        leftPressed = true;
        break;
      case RIGHT:
        rightPressed = true;
        break;
      }
  }
}

void keyReleased(){
  if (key == CODED) {
    switch (keyCode) {
      case UP:
        upPressed = false;
        break;
      case DOWN:
        downPressed = false;
        break;
      case LEFT:
        leftPressed = false;
        break;
      case RIGHT:
        rightPressed = false;
        break;
    }
  }

}
