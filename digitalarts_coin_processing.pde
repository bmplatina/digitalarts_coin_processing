import hypermedia.net.*;

public class udp_server extends Thread {
  UDP udp;
  int beforeCount = 0;
  int currentCount = 0;
  udp_server(int _port) {
      port = _port;
      udp = new UDP(this, port);
      udp.listen(true);
  }
  
  void send(String _data) {
      udp.send(_data, ip, port);
  }

  int getCurrentCount(){
    return currentCount;
  }

  boolean isCountChanged(){
    if(beforeCount != currentCount){
        beforeCount = currentCount;
        return true;
    }
    return false;
  }
  
  public void run() {
      try {
          while (!Thread.currentThread().isInterrupted()) {
            Thread.sleep(500);
          }
      }
      catch(Exception errorCode) {
         println("Exception occured: " + errorCode);
      }
  }

  void receive(byte[] data, String receive_ip, int receive_port) {
    print("Last Coin Price: ");
    for(int i=0; i<5; i++) {
        lastCoinPrices[i] = coinPrices[i];
        print(lastCoinPrices[i]);
    }
    println("");
    diaStockPriceChanges = diaStockPrice - lastDiaStockPrice;
    lastDiaStockPrice = diaStockPrice;
    String msg = new String(data);
    // println(msg);
    String readMsg[] = msg.split(",");
    for(int i=0; i<7; i++) {
      // print(readMsg[i]);
      parsedElements[i] = readMsg[i];
    }
    if(parsedElements[0].contains("##UI")) {
      print("Current Coin Price: ");
      currentCount = Integer.parseInt(parsedElements[1]);
      for(int i=0; i<5; i++) {
          coinPrices[i] = Integer.parseInt(parsedElements[i+2]);
          print(coinPrices[i]);
      }
      println("");
    }
    print("Changelog of Coin Price: ");
    for(int i=0; i<5; i++) {
        coinPriceChanges[i] = coinPrices[i] - lastCoinPrices[i];
        print(coinPriceChanges[i] + ",");
    }
    println("");
    kospi = Integer.toString(int(random(1, 10)));

    //println("articles.length: " + articles.length);
    // for(int i=0; i < articles.length; i++) {
    //   splittedArticle = articles[i].split("/");
      // println(splittedArticle[1]);
      // if(Integer.parseInt(splittedArticle[0]) == count) {
      //   showArticle = splittedArticle[1];
      // }
      // else {
      //   showArticle = "";
      // }
    // }
  }
}
