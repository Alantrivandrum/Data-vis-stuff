Table table;
ArrayList<Float> LONC = new ArrayList<Float>();
ArrayList<Float> LATC = new ArrayList<Float>();
ArrayList<String> CITY = new ArrayList<String>();
ArrayList<Float> LONT = new ArrayList<Float>();
ArrayList<Integer>TEMP = new ArrayList<Integer>();
ArrayList<Integer> DAYS= new ArrayList<Integer>();
ArrayList<String> MON = new ArrayList<String>();
ArrayList<Integer> DAY = new ArrayList<Integer>();
ArrayList<Float> LONP = new ArrayList<Float>();
ArrayList<Float> LATP = new ArrayList<Float>();
ArrayList<Integer> SURV= new ArrayList<Integer>();
ArrayList<String> DIR = new ArrayList<String>();
ArrayList<Integer> DIV = new ArrayList<Integer>();
float XP1;
float XP2;
float YP1;
float YP2;
int count;


void setup(){
  table = loadTable("/../minard-data.csv","header");
  fullScreen();
  count = table.getRowCount();
  for (int i = 0; i < count; i++){
    TableRow row = table.getRow(i);
    LONC.add(row.getFloat("LONC"));
    LATC.add(row.getFloat("LATC"));
    CITY.add(row.getString("CITY"));
    LONT.add(row.getFloat("LONT"));
    TEMP.add(row.getInt("TEMP"));
    DAYS.add(row.getInt("DAYS"));
    MON.add(row.getString("MON"));
    DAY.add(row.getInt("DAY"));
    LONP.add(row.getFloat("LONP"));
    LATP.add(row.getFloat("LATP"));
    SURV.add(row.getInt("SURV"));
    DIR.add(row.getString("DIR"));
    DIV.add(row.getInt("DIV"));
  }
}


void draw(){
  background(255);
  for(int i=0; i<count-1; i++){
    XP1 = LONP.get(i)*120 -2750;
    YP1 = -LATP.get(i)*120 + 7000;
    XP2 = LONP.get(i+1)*120 -2750;
    YP2 = -LATP.get(i+1)*120 + 7000;
    drawCities();
    if(DIR.get(i).equals("A")){
    stroke(0,255,0);
    strokeWeight(SURV.get(i)/2750);
    line(XP1,YP1,XP2,YP2);
    drawCities();
  }
  }
   for(int i=0; i<count-1; i++){
    XP1 = LONP.get(i)*120 -2750;
    YP1 = -LATP.get(i)*120 + 7000;
    XP2 = LONP.get(i+1)*120 -2750;;
    YP2 = -LATP.get(i+1)*120 + 7000;
    drawCities();
    if(DIR.get(i).equals("R")){
    stroke(255,0,0);
    strokeWeight(SURV.get(i)/2750);
    line(XP1,YP1,XP2,YP2);
    drawCities();
  }
   }
    
  drawTempGraph();
  drawLegend();
  drawTitle();
 
 
}


  
  
  void drawCities(){
    stroke(0);
    strokeWeight(3);
    for(int i=0; i<count-1;i++){
    float X = LONC.get(i)*120 -2750;
    float Y = -LATC.get(i)*120 + 7000;
    fill(255,0,0);
    square(X, Y, 7);
    fill(0);
    textSize(16);
    text(CITY.get(i),X-10, Y-10);
    }
  }
    
    void drawTempGraph(){
      ArrayList<Float> normalizedLonT = normalizeLonT(LONT);
      ArrayList<Float> normalizedTemp = normalizeTemp(TEMP);
      strokeWeight(0);
    fill(254,251,234);
    rect(100,600,1700,400);
    line(100,1000,1800,1000);
    line(1800,600,1800,1000);
    stroke(0);
    fill(0);
    strokeWeight(2);
    text("-30C", 1810, 1000);
    text("-20C", 1810, 1000-(400/3));
    text("-10C", 1810, 1000-(800/3));
    text("Temperature",1820,785);
    text("in celsius",1820,800);
    text("0C", 1810, 600);
    strokeWeight(0);
    for(float i=0; i<4;i++){
      line(100,600+i*(400/3),1800,600+i*(400/3));
    }
      
     System.out.println(normalizedTemp.get(3));
    for(int i=0; i<count-1;i++){
      strokeWeight(7);
      point(normalizedLonT.get(i)*1700+100,(1-normalizedTemp.get(i))*400+600);
      if(DAY.get(i) != 0 || !MON.get(i).equals(""))
      {
      String text = DAY.get(i)  + " " + MON.get(i); 
      text(text,normalizedLonT.get(i)*1700+100,(1-normalizedTemp.get(i))*400+625);
      }
      strokeWeight(2);
      line(normalizedLonT.get(i)*1700+100, (1-normalizedTemp.get(i))*400+600,normalizedLonT.get(i+1)*1700+100,(1-normalizedTemp.get(i+1))*400+600 );
    }
    }
    
    
    ArrayList<Float> normalizeLonT(ArrayList<Float> LONT){
      ArrayList<Float> normalizedLonT = new ArrayList<Float>();
      float max = 37.6;
      float min = 25.3;
      for(int i=0; i<LONT.size(); i++){
        normalizedLonT.add((LONT.get(i)-min)/(max-min));
      }
      return normalizedLonT;
      
    }
    
     ArrayList<Float> normalizeTemp(ArrayList<Integer> temp){
      ArrayList<Float> normalizedTemp= new ArrayList<Float>();
      float max = 0.0;
      float min = -30.0;
      for(int i=0; i<temp.size(); i++){
        normalizedTemp.add((float)(TEMP.get(i)-min)/(max-min));
      }
      return normalizedTemp;
      
    }
    
    void drawLegend(){
      stroke(0);
      fill(255);
      rect(50,50, 500,200);
      strokeWeight(340000/2750);
      stroke(0,255,0);
      line(125,125,125,125);
      fill(0);
      text("340000", 100,130);
      text("Arriving troops", 80, 205);
      strokeWeight(100000/2750);
      stroke(255,0,0);
      line(250,150,250,150);
      text("100000", 225,125);
      text("Retreating troops", 225, 205);
      stroke(0);
      strokeWeight(3);
      fill(255,0,0);
      square(380, 140, 20);
      fill(0);
      text("Cities", 375, 205);
      textSize(30);
      text("L",500,85);
      text("E",500,115);
      text("G",500,145);
      text("E",500,175);
      text("N",500,205);
      text("D",500,235);
      }
      
      void drawTitle(){
        fill(254,251,234);
        rect(620,90,1175,90);
        fill(0);
        textSize(50);
        PFont font = createFont("Nunito-Bold.ttf",45);
        textFont(font);
        text("Minard's visualization of Napolean's Russian Campaign",633,150);
      }
  
  

  
