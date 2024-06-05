
import 'package:list_of_clients/clients/clients.dart';
import 'package:list_of_clients/clients/clients_info.dart';

class ClientsRepository implements ClientsInfo {
  final List<Client> _clients = [
    VipClient('Асан', 'Усонов'),
    VipClient('Kyle', 'McCandy'),
    RegularClient('Каныкей', 'Джусупова'),
    RegularClient('Юлдаш', 'Абду'),
    RegularClient('Камила', 'Абду'),
    VipClient('Kail', 'Koskin'),
  ];

  @override
  List<Client> getAllClients() => _clients;

  @override
  Client? findClient(String firstName) {
    try {
      return _clients.firstWhere((client) => client.firstName == firstName);
    } catch (e) {
      return null;
    }
  }
}
