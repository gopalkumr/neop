import 'package:appwrite/appwrite.dart';

/*

class AppwriteClient {
  static Client getClient() {
    return Client()
      ..setEndpoint('http://35.231.3.242/v1') // Your API Endpoint
      ..setProject('64305dfd6509db5faf1f')
      ..setSelfSigned(status: true); // Your project ID;
  }
}
*/
class AppwriteClient {
  static Client getClient() {
    return Client()
      ..setEndpoint('http://35.224.169.73/v1') // Your API Endpoint
      ..setProject('643185a448ddb4226d70')
      ..setSelfSigned(status: true); // Your project ID;
  }
}

class Appwrite {
  static Client client = AppwriteClient.getClient();
  static Account account = Account(client);
  static Databases database = Databases(client);
  static Storage storage = Storage(client);
}
