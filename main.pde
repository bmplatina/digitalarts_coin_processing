udp_server udpServer = new udp_server(port);

void setup() {
    size(1600, 900);
    udpServer.start();

    dosMyungjo = createFont("DOSMyungjo.ttf", 24);
    background = loadImage("bg.jpg");

    // 식품, 챗, 테크, 엔터, 건축 순서
    diaFood = loadImage("diaFood.png");
    diaChat = loadImage("diaChat.png");
    diaTech = loadImage("diaTech.png");
    diaEnter = loadImage("diaEntertainment.png");
    diaConst = loadImage("diaConstruction.png");
    diaStock = loadImage("diaStock.png");
}

void draw() {
    if(parsedElements[0].contains("##UI")) {
        count = Integer.parseInt(parsedElements[1]);
        for(int i=0; i<5; i++) {
            coinPrices[i] = Integer.parseInt(parsedElements[i+2]);
            println(coinPrices[i]);
        }
    }
    image(background, 0, 0, width, height); // 백그라운드

    image(diaFood, 94, 292, 197, 197);
    image(diaChat, 396, 292, 197, 197);
    image(diaTech, 696, 292, 197, 197);
    image(diaEnter, 1000, 292, 197, 197);
    image(diaConst, 1300, 292, 197, 197);
    image(diaStock, 14.5, 738.5, 108.2, 108.2);
    textAlign(CENTER);
    textFont(dosMyungjo, 36);
    fill(#000000);
    for(float i=-3.5f; i<=3.5f; i += 1.0f) { // 검은색 텍스트 스트로크
        text("디아식품", 192.5+i, 547);
        text("디아식품", 192.5, 547.0+i);
        text("디아챗", 494.5+i, 547);
        text("디아챗", 494.5+i, 547.0+i);
        text("디아테크", width/2+i, 547);
        text("디아테크", width/2, 547.0+i);
        text("디아엔터", 1098.5+i, 547);
        text("디아엔터", 1098.5, 547.0+i);
        text("디아건축", 1398.5+i, 547);
        text("디아건축", 1398.5, 547.0+i);
    }
    fill(#FFFFFF);
    text("디아식품", 192.5, 547);
    text("디아챗", 494.5, 547);
    text("디아테크", width/2, 547);
    text("디아엔터", 1098.5, 547);
    text("디아건축", 1398.5, 547);
    textFont(dosMyungjo, 40);
    fill(#000000);
    for(float i=-3.5f; i<=3.5f; i += 1.0f) { // 검은색 텍스트 스트로크
        text("디아증권", 228.0+i, 768);
        text("디아증권", 228, 768.0+i);
    }
    fill(#FFFFFF);
    text("디아증권", 228, 768);
    text("Count: " + count, width/2, height/2);
    text("Coin 1: " + coinPrices[0], width/2, height/2+50);
    text("Coin 2: " + coinPrices[1], width/2, height/2+100);
    text("Coin 3: " + coinPrices[2], width/2, height/2+150);
    text("Coin 4: " + coinPrices[3], width/2, height/2+200);
    text("Coin 5: " + coinPrices[4], width/2, height/2+250);

    lastDiaStockPrice = diaStockPrice;
    for(int i=0; i<5; i++) {
        lastCoinPrices[i] = coinPrices[i];
    }
}