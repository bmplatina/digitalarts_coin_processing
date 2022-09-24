import hypermedia.net.*;

public class udp_server extends Thread {
  UDP udp;
  
  udp_server(int _port) {
      port = _port;
      udp = new UDP(this, port);
      udp.listen(true);
  }
  
  void send(String _data) {
      udp.send(_data, ip, port);
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
    
    String msg = new String(data);
    println(msg);
    String readMsg[] = msg.split(",");
    for(int i=0; i<7; i++) {
      print(readMsg[i]);
      parsedElements[i] =  readMsg[i];
    }
  }
}
