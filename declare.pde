// 네트워킹
int port = 7750;
String ip = "172.16.204.113";

// cnt, 코인 가격
int count=0;
String[] parsedElements = {"0", "0", "0", "0", "0", "0", "0"};
String[] articles;
int[] coinPrices = {0, 0, 0, 0, 0};
int[] lastCoinPrices = {0, 0, 0, 0, 0};
int[] coinPriceChanges = {0, 0, 0, 0, 0};
int diaStockPrice = 0, lastDiaStockPrice = 0, diaStockPriceChanges = 0;

// 이미지 애셋, 코인은 식품, 챗, 테크, 엔터, 건축 순서
PImage background;
PImage diaFood;
PImage diaChat;
PImage diaTech;
PImage diaEnter;
PImage diaConst;
PImage diaStock;

PFont dosMyungjo; // 찌라시 폰트
PFont coinFont; // 가격 변동에 대한 폰트

void textWithStroke(String text, int pixels, float x, float y, int textSize, color strokeColor, color innerColor) {
    textFont(dosMyungjo, textSize);
    fill(strokeColor);
    for(float i=0.0f-pixels/2; i<=0.0f+pixels/2; i+=1.0f) {
        text(text, x+i, y);
        text(text, x, y+i);
    }
    fill(innerColor);
    text(text, x, y);
}

String checkIncreasing(int i) {
    String isIncreasing = "";
    if(coinPriceChanges[i]>0) {
        isIncreasing = "+";
    }
    else if(coinPriceChanges[i]==0) {
        isIncreasing = "±";
    }
    else if(coinPriceChanges[i]<0){
        isIncreasing = "";
    }
    return isIncreasing;
}