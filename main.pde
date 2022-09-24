
// 네트워킹
int port = 7750;
String ip = "192.168.0.255";

// cnt, 코인 가격

int count;
String[] parsedElements = {"0", "0", "0", "0", "0", "0", "0"};
int[] coinPrices = {0, 0, 0, 0, 0};

udp_server udpServer = new udp_server(port);

void setup() {
    size(960, 480);
    textAlign(CENTER);
    udpServer.start();
}

void draw() {
    background(#4188F1);
    if(parsedElements[0].contains("##UI")) {
        count = Integer.parseInt(parsedElements[1]);
        for(int i=0; i<5; i++) {
            coinPrices[i] = Integer.parseInt(parsedElements[i+2]);
            println(coinPrices[i]);
        }
    }
    text("Count: " + count, width/2, height/2);
    text("Coin 1: " + coinPrices[0], width/2, height/2+50);
    text("Coin 2: " + coinPrices[1], width/2, height/2+100);
    text("Coin 3: " + coinPrices[2], width/2, height/2+150);
    text("Coin 4: " + coinPrices[3], width/2, height/2+200);
    text("Coin 5: " + coinPrices[4], width/2, height/2+250);
}