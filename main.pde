udp_server udpServer = new udp_server(port);

void setup() {
    //  size(1600, 900);
    fullScreen();
    udpServer.start();

    dosMyungjo = createFont("DOSMyungjo.ttf", 24);
    textAlign(CENTER);
    background = loadImage("bg.jpg");
    articles = loadStrings("articles_day1.txt");
    //---------------------------------------------
    for(int i=0; i<articles.length; i++){
        println("i=" + str(i) + " -> " + articles[i]);
        String[] result = articles[i].split("/");
        println("a1:" + result[0] + " a2:" + result[1]);
        
        array_articles_cnt.add( Integer.parseInt(result[0]) );
        array_articles_String.add(result[1]);

    }
    
    print(articles.length );



    // 식품, 챗, 테크, 엔터, 건축 순서
    diaFood = loadImage("diaFood.png");
    diaChat = loadImage("diaChat.png");
    diaTech = loadImage("diaTech.png");
    diaEnter = loadImage("diaEntertainment.png");
    diaConst = loadImage("diaConstruction.png");
    diaStock = loadImage("diaStock.png");
}
// 153 801
void draw() {
    image(background, 0, 0, width, height);
    image(diaFood, 94, 292, 197, 197);
    image(diaChat, 396, 292, 197, 197);
    image(diaTech, 696, 292, 197, 197);
    image(diaEnter, 1000, 292, 197, 197);
    image(diaConst, 1300, 292, 197, 197);
    image(diaStock, 14.5, 738.5, 108.2, 108.2);
    
    textAlign(CENTER);
    textWithStroke("디아식품", 7, 192.5, 547.0, 36, #000000, #FFFFFF);
    textWithStroke(coinPrices[0] + " (" + checkIncreasing(0) + Integer.toString(coinPriceChanges[0]) + ")", 7, 192.5, height/2+150, 36, #FFFFFF, changeColor);
    textWithStroke("디아챗", 7, 494.5, 547.0, 36, #000000, #FFFFFF);
    textWithStroke(coinPrices[1] + " (" + checkIncreasing(1) + Integer.toString(coinPriceChanges[1]) + ")", 7, 494.5, height/2+150, 36, #FFFFFF, changeColor);
    textWithStroke("디아테크", 7, width/2, 547.0, 36, #000000, #FFFFFF);
    textWithStroke(coinPrices[2] + " (" + checkIncreasing(2) + Integer.toString(coinPriceChanges[2]) + ")", 7, width/2, height/2+150, 36, #FFFFFF, changeColor);
    textWithStroke("디아엔터", 7, 1098.5, 547.0, 36, #000000, #FFFFFF);
    textWithStroke(coinPrices[3] + " (" + checkIncreasing(3) + Integer.toString(coinPriceChanges[3]) + ")", 7, 1098.5, height/2+150, 36, #FFFFFF, changeColor);
    textWithStroke("디아건설", 7, 1398.5, 547.0, 36, #000000, #FFFFFF);
    textWithStroke(coinPrices[4] + " (" + checkIncreasing(4) + Integer.toString(coinPriceChanges[4]) + ")", 7, 1398.5, height/2+150, 36, #FFFFFF, changeColor);
    textWithStroke("디아증권", 7, 228.0, 768.0, 40, #000000, #FFFFFF);
    
    textAlign(LEFT);
    textWithStroke(kospi, 7, 153, 820, 42, #000000, #FFFFFF);
    textWithStroke(display_text1, 7, 378, 770, 36, #000000, #FFFFFF);
    textWithStroke(display_text2, 7, 378, 810, 36, #000000, #FFFFFF);
                
    //-------
    
    if(udpServer.isCountChanged()){
        int cnt = udpServer.getCurrentCount();
        for(int i=0; i<array_articles_cnt.size(); i++ ){   
            if( array_articles_cnt.get(i) ==  cnt ){
                log = array_articles_String.get(i );
                display_text1 = "";
                display_text2 = "";
                for(int a=0; a< log.length(); a++  ){
                    if( a < 36){
                        display_text1 = display_text1 + log.charAt(a);
                    }else{
                        display_text2 = display_text2 + log.charAt(a);
                    }
                }
            }
        }
    }
    


    // textWithStroke(showArticle, 7, 378, 770, 36, #000000, #FFFFFF);
}