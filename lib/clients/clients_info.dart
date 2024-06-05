import 'clients.dart';

abstract class ClientsInfo{
  List<Client> getAllClients();
  Client? findClient(String firstName);
}