import 'package:appwrite/appwrite.dart';
import 'appwrite_key.dart';

class AppwriteClient {
  static Client getClient() {
    return Client()
      ..setEndpoint(endpoint) // Your API Endpoint
      ..setProject(project_id)
      ..setSelfSigned(status: true); // Your project ID;
  }
}

class Appwrite {
  static Client client = AppwriteClient.getClient();
  static Account account = Account(client);
  static Databases database = Databases(client);
  static Storage storage = Storage(client);
}
