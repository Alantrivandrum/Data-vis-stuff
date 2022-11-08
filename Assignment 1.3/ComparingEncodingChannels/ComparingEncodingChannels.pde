import java.util.*;
Table table;
ArrayList<Float> years = new ArrayList<Float>();
ArrayList<Float> lifeExpectancies = new ArrayList<Float>();
ArrayList<Float> gdps = new ArrayList<Float>();
ArrayList<String> continents = new ArrayList<String>();
ArrayList<Float> randomizedX = new ArrayList<Float>();
ArrayList<Float> populations = new ArrayList<Float>();

float SCREEN_PADDING = 200;


float maxLifeExp = Float.MIN_VALUE;
float minLifeExp = Float.MAX_VALUE;

float maxYear = Float.MIN_VALUE;
float minYear = Float.MAX_VALUE;
float maxGdp = Float.MIN_VALUE;
float minGdp = Float.MAX_VALUE;

int length = 0;
void setup(){
  table = loadTable("/../gapminder.csv","header");
  fullScreen();
  getData();
}

void draw(){
  background(255);
  stroke(0);
  strokeWeight(1);
  //drawGraph1();
  //drawGraph2();  //<>//
  //drawGraph3();
  //drawGraph4();
  //drawGraph5();
  //drawGraph6();
  drawGraph7();
}


public void changeContinentColour(String continent){
     if(continent.equals("Africa")){
      fill(0,255,0);
    }
    else if(continent.equals("Asia")){
      fill(255,0,0);
    }
    else if(continent.equals("Europe")){
      fill(0,0,255);
    }
    else if(continent.equals("Americas")){
      fill(255,255,0);
    }
    else if(continent.equals("Oceania")){
      fill(0);
    }

}

public void changePopColour(Float pop){
     if(pop>200000000){
      fill(255,0,0);
    }
    else if(pop>50000000){
      fill(0,255,0);
    }
    else if(pop>10000000){
      fill(0,0,255);
    }
    else if(pop>1000000){
      fill(255,255,0);
    }
    else {
      fill(0,0,0);
    }

}

public float changeContinentSize(String continent){
     if(continent.equals("Africa")){
      return 5.0;
    }
    else if(continent.equals("Asia")){
      return 10;
    }
    else if(continent.equals("Europe")){
      return 15;
    }
    else if(continent.equals("Americas")){
      return 20;
    }
    else{
      return 25;
    }

}

public float changePopSize(Float pop){
     if(pop>200000000){
      return 25;
    }
    else if(pop>50000000){
      return 20;
    }
    else if(pop>10000000){
      return 15;
    }
    else if(pop>1000000){
      return 10;
    }
    else {
      return 5;
    }

}

public void drawGraphs(){
  stroke(0);
  int year = 1952;
  for(int i=0; i<12; i++){
    fill(0);
    strokeWeight(1);
    textSize(25);
    text(String.valueOf(year),145+138*i + 25,187-10);
    fill(255);
    rect(145+138*i,187,120,800);
     strokeWeight(0.25);
    for(int j=1; j<10;j++){
      strokeWeight(0.25);
    line(145+138*i,187+80*j,145+138*i+120,187+80*j);
  }
  
    year+=5;
  }
  fill(0);
  textSize(20);
  for(int i=8; i>=0;i--){
    text(String.valueOf(i*10+10),145-50,987-100*i);
  } 
  
  textSize(17.5);
  text("Life ",30,525);
  text("Expectancy",10,545);
  textSize(20);
  text("Years", 875,140);

}


public void drawGraphs2(){
  stroke(0);
  fill(255);
  rect(100,200,1700,800);
  fill(0);
  for(int i=0; i<10; i++){
    line(80,200+80*i,100,200+80*i);
    text((10-i)*10,50,200+ 80*i);
  }
  for(int i=0; i<5; i++){
    line(100+i*340,200,100+i*340,1000);
    text(25000*i,100+i*340-25, 1025);  
  }
  line(80,1000,100,1000);
  text(0,50,1000);
  text(125000,1775,1025);
  text("GDP per Capita", 860, 1050);
  text("Life Expectancy", 10, 150);
}

public void drawLegend(){
  fill(255);
  strokeWeight(1);
  rect(1350,10,500,100);
  fill(255,0,0);
  circle(1400,60,10);
  fill(0,255,0);
  circle(1475,60,10);
   fill(0,0,255);
  circle(1550,60,10);
   fill(255,255,0);
  circle(1625,60,10);
   fill(0);
  circle(1700,60,10);
  textSize(15);
  text("Asia",1385,90);
  text("Africa",1455,90);
  text("Europe",1530,90);
  text("Americas",1605,90);
  text("Oceania",1680,90);
  textSize(25);
  text("Legend", 1750, 75);
}

public void drawLegendFinal(){
  fill(255);
  strokeWeight(1);
  rect(800,10,1100,100);
  fill(0);
  circle(850,60,5);
  circle(950,60,10);
  circle(1050,60,15);
  circle(1150,60,20);
  circle(1250,60,25);
  fill(255,0,0);
  circle(1400,60,10);
  fill(0,255,0);
  circle(1475,60,10);
   fill(0,0,255);
  circle(1550,60,10);
   fill(255,255,0);
  circle(1625,60,10);
   fill(0);
  circle(1700,60,10);
  textSize(15);
  text("Pop<1mil",825,90);
  text("1mil < Pop < 10mil",900,40);
  text("10mil < Pop < 50mil",985,90);
  text("50mil < Pop < 200mil",1085,40);
  text("Pop > 200mil",1225,90);
  text("Asia",1385,90);
  text("Africa",1455,90);
  text("Europe",1530,90);
  text("Americas",1605,90);
  text("Oceania",1680,90);
  textSize(25);
  text("Legend", 1750, 75);
}

public void drawLegendPop(){
  fill(255);
  strokeWeight(1);
  rect(1100,10,700,100);
  fill(255,0,0);
  circle(1200,60,10);
  fill(0,255,0);
  circle(1300,60,10);
   fill(0,0,255);
  circle(1400,60,10);
   fill(255,255,0);
  circle(1500,60,10);
   fill(0);
  circle(1600,60,10);
  textSize(15);
  text("Pop>200mil",1150,90);
  text("200mil >Pop> 50mil",1235,45);
  text("50mil >Pop> 10mil",1335,90);
  text("10mil >Pop> 1mil",1435,45);
  text("Pop<1 million",1560,90);
  textSize(25);
  text("Legend", 1675, 70);
}

public void drawLegendPop2(){
  fill(255);
  strokeWeight(1);
  rect(1100,10,700,100);
  fill(255,0,0);
  circle(1200,60,25);
  fill(0,255,0);
  circle(1300,60,20);
   fill(0,0,255);
  circle(1400,60,15);
   fill(255,255,0);
  circle(1500,60,10);
   fill(0);
  circle(1600,60,5);
  textSize(15);
  text("Pop>200mil",1150,90);
  text("200mil >Pop> 50mil",1235,45);
  text("50mil >Pop> 10mil",1335,90);
  text("10mil >Pop> 1mil",1435,45);
  text("Pop<1 million",1560,90);
  textSize(25);
  text("Legend", 1675, 70);
}

public void drawLegendPop3(){
  fill(255);
  strokeWeight(1);
  rect(1100,10,700,100);
  fill(255,0,0);
  circle(1200,60,10);
  fill(0,255,0);
  rect(1300,60,10,10);
   fill(0,0,255);
  rect(1400,60,5,12);
   fill(255,255,0);
  triangle(1510,60,1500,60,1500,70);
   fill(0);
  ellipse(1600,60,20,10);
  textSize(15);
  text("Pop>200mil",1150,90);
  text("200mil >Pop> 50mil",1235,45);
  text("50mil >Pop> 10mil",1335,90);
  text("10mil >Pop> 1mil",1435,45);
  text("Pop<1 million",1560,90);
  textSize(25);
  text("Legend", 1675, 70);
}


public void drawLegend2(){
  fill(255);
  strokeWeight(1);
  rect(1350,10,500,100);
  fill(255,0,0);
  rect(1392.5,55,10,10);
  fill(0,255,0);
  circle(1470,60,10);
   fill(0,0,255);
  rect(1548,55,5,12);
   fill(255,255,0);
  triangle(1635,60,1625,60,1625,70);
  fill(0);
  ellipse(1700,60,20,10);
  textSize(15);
  text("Asia",1385,90);
  text("Africa",1455,90);
  text("Europe",1530,90);
  text("Americas",1605,90);
  text("Oceania",1680,90);
  textSize(25);
  text("Legend", 1750, 75);
}
    
public void drawLegend3(){
  fill(255);
  strokeWeight(1);
  rect(1350,10,500,100);
  fill(255,0,0);
  circle(1400,60,10);
  circle(1475,60,5);
  circle(1550,60,15);
  circle(1625,60,20);
  circle(1700,60,25);
  textSize(15);
  fill(0);
  text("Asia",1385,90);
  text("Africa",1455,90);
  text("Europe",1530,90);
  text("Americas",1605,90);
  text("Oceania",1680,90);
  textSize(25);
  text("Legend", 1750, 75);
}
public float normalise(float value, float min, float max) {
     return (value - min) / (max - min);
}

public float scaleGraph(float value, float scale, float padding) {
  return (value * scale) + padding;
}

public float randomizeX(float X){
  return random(X-1.05,X+1.05);
}

public float XGdp(float X, float gdp, float maxGdp){
  return X+0.000195*(gdp/maxGdp);
}


void getData() {
    for(TableRow row: table.rows()){
      length++;
      String country = row.getString("country");
      Float year = row.getFloat("year");
      Float lifeExpectancy = row.getFloat("lifeExp");
      String continent = row.getString("continent");
      Float gdp = row.getFloat("gdpPercap");
      Float randomizedYear = randomizeX(year);
      Float pop = row.getFloat("pop");
      randomizedX.add(randomizedYear);
      continents.add(continent);
      years.add(year);
      gdps.add(gdp);
      populations.add(pop);
      lifeExpectancies.add(lifeExpectancy);
      maxLifeExp = Math.max(lifeExpectancy, maxLifeExp);
      minLifeExp = Math.min(lifeExpectancy, minLifeExp);
      maxYear = Math.max(maxYear, year);
      minYear = Math.min(minYear, year);
      minGdp = Math.min(minGdp, gdp);
      maxGdp = Math.max(minGdp, gdp);
  }
}

public void changeContinentShapes(String continent, float x, float y){
  if(continent.equals("Africa")){
    fill(0,255,0);
  circle(
      scaleGraph(x, (width - (SCREEN_PADDING * 2.0)), SCREEN_PADDING), 
      scaleGraph(y, (height - (SCREEN_PADDING * 2)), 265),
    10  );
}
else if(continent.equals("Asia")){
  fill(255,0,0);
  rect(scaleGraph(x, (width - (SCREEN_PADDING * 2.0)), SCREEN_PADDING), 
      scaleGraph(y, (height - (SCREEN_PADDING * 2)), 265),10,10);
}
else if(continent.equals("Americas")){
  fill(255,255,0);
  float X = scaleGraph(x, (width - (SCREEN_PADDING * 2.0)), SCREEN_PADDING);
  float Y =  scaleGraph(y, (height - (SCREEN_PADDING * 2)), 265);
  triangle(X+10,Y,X,Y,X,Y+10);
}
else if(continent.equals("Europe")){
  fill(0,0,255);
   rect(scaleGraph(x, (width - (SCREEN_PADDING * 2.0)), SCREEN_PADDING), 
      scaleGraph(y, (height - (SCREEN_PADDING * 2)), 265),5,12);
}
else if(continent.equals("Oceania")){
    fill(0);
  ellipse(
      scaleGraph(x, (width - (SCREEN_PADDING * 2.0)), SCREEN_PADDING), 
      scaleGraph(y, (height - (SCREEN_PADDING * 2)), 265),
    20,10);
}
}


public void changePopShapes(Float pop, float x, float y){
  if(pop>200000000){
    fill(255,0,0);
  circle(
      scaleGraph(x, (width - (SCREEN_PADDING * 9.565)), SCREEN_PADDING-50), 
      scaleGraph(y, (height - (SCREEN_PADDING *2.4)), SCREEN_PADDING+80),
    10  );
}
else if(pop>50000000){
  fill(0,255,0);
  rect(scaleGraph(x, (width - (SCREEN_PADDING * 9.565)), SCREEN_PADDING-50), 
      scaleGraph(y, (height - (SCREEN_PADDING *2.4)), SCREEN_PADDING+80),10,10);
}
else if(pop>10000000){
  fill(255,255,0);
  float X = scaleGraph(x, (width - (SCREEN_PADDING * 9.565)), SCREEN_PADDING-50); //<>//
  float Y =  scaleGraph(y, (height - (SCREEN_PADDING *2.4)), SCREEN_PADDING+80); //<>//
  triangle(X+10,Y,X,Y,X,Y+10);
}
else if(pop>1000000){
  fill(0,0,255);
   rect(scaleGraph(x, (width - (SCREEN_PADDING * 9.565)), SCREEN_PADDING-50), 
      scaleGraph(y, (height - (SCREEN_PADDING *2.4)), SCREEN_PADDING+80),5,12);
}
else {
    fill(0);
  ellipse(
      scaleGraph(x, (width - (SCREEN_PADDING * 9.565)), SCREEN_PADDING-50), 
      scaleGraph(y, (height - (SCREEN_PADDING *2.4)), SCREEN_PADDING+80),
    20,10);
}
}

public void drawGraph1(){
     drawGraphs();
  for(int i=0; i< length;i++){

    changeContinentColour(continents.get(i));  
    float x, y;
    x = normalise(randomizedX.get(i), minYear, maxYear);
    y = 1 - normalise(lifeExpectancies.get(i), minLifeExp, maxLifeExp);

    circle(
      scaleGraph(x, (width - (SCREEN_PADDING * 2.0)), SCREEN_PADDING), 
      scaleGraph(y, (height - (SCREEN_PADDING * 2)), 265),
    10  );
  }
  
  drawLegend();
}

public void drawGraph2(){
  drawGraphs();
  stroke(0);
  strokeWeight(1);
  for(int i=0; i< length;i++){

    float x, y;
    x = normalise(randomizedX.get(i), minYear, maxYear);
    y = 1 - normalise(lifeExpectancies.get(i), minLifeExp, maxLifeExp);
    changeContinentShapes(continents.get(i),x,y);
    
  }
  drawLegend2();
}


public void drawGraph3(){
     drawGraphs();
  for(int i=0; i< length;i++){
    strokeWeight(1);
    stroke(0,0,255);
    fill(255,0,0);
    //changeContinentColour(continents.get(i));  
    float x, y;
    x = normalise(randomizedX.get(i), minYear, maxYear);
    y = 1 - normalise(lifeExpectancies.get(i), minLifeExp, maxLifeExp);

    float size = changeContinentSize(continents.get(i));
    circle(
      scaleGraph(x, (width - (SCREEN_PADDING * 2.0)), SCREEN_PADDING), 
      scaleGraph(y, (height - (SCREEN_PADDING * 2)), 265),
    size);
  }
  
  drawLegend3();
}

public void drawGraph4(){
  drawGraphs2();
  for(int i=0; i< length;i++){
    strokeWeight(1);
    stroke(0,0,255);
    changePopColour(populations.get(i));  
    float x, y;
    x = normalise(gdps.get(i), minGdp, maxGdp);
    y = 1 - normalise(lifeExpectancies.get(i), minLifeExp, maxLifeExp);
    //circle(x,y,10);
    //float size = changeContinentSize(continents.get(i));
    circle(
      scaleGraph(x, (width - (SCREEN_PADDING * 9.565)), SCREEN_PADDING-50), 
      scaleGraph(y, (height - (SCREEN_PADDING *2.4)  ), SCREEN_PADDING+80),
    15);
  }
  
  drawLegendPop();
}

public void drawGraph5(){
  drawGraphs2();
  for(int i=0; i< length;i++){
    strokeWeight(1);
    stroke(0,0,255);
    changePopColour(populations.get(i));  
    float x, y;
    x = normalise(gdps.get(i), minGdp, maxGdp);
    y = 1 - normalise(lifeExpectancies.get(i), minLifeExp, maxLifeExp);
    //circle(x,y,10);
    float size = changePopSize(populations.get(i));
    circle(
      scaleGraph(x, (width - (SCREEN_PADDING * 9.565)), SCREEN_PADDING-50), 
      scaleGraph(y, (height - (SCREEN_PADDING *2.4)  ), SCREEN_PADDING+80),
    size);
  }
  
  drawLegendPop2();
}

public void drawGraph6(){
  drawGraphs2();
  for(int i=0; i< length;i++){
    strokeWeight(1);
    stroke(0);
    fill(255,0,0);
   // changePopColour(populations.get(i));  
    float x, y;
    x = normalise(gdps.get(i), minGdp, maxGdp);
    y = 1 - normalise(lifeExpectancies.get(i), minLifeExp, maxLifeExp);
    changePopShapes(populations.get(i),x,y);

  }
  
  drawLegendPop3();
}

public void drawGraph7(){
     drawGraphs();
  for(int i=0; i< length;i++){

    changeContinentColour(continents.get(i));
    float size = changePopSize(populations.get(i));
    float x, y;
    x = XGdp(normalise(randomizedX.get(i), minYear, maxYear),gdps.get(i),maxGdp);
    y = 1 - normalise(lifeExpectancies.get(i), minLifeExp, maxLifeExp);
    

    circle(
      scaleGraph(x, (width - (SCREEN_PADDING * 2.0)), SCREEN_PADDING), 
      scaleGraph(y, (height - (SCREEN_PADDING * 2)), 265),
    size);
  }
  fill(0);
  for(int i=0; i<12; i++){
  text("Gdp to scale", 145+140*i,1030);
  }
  
  drawLegendFinal();
}
