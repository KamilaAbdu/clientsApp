abstract class Client {

final String firstName;
final String lastName;

Client(this.firstName, this.lastName);
}

class VipClient extends Client {
  VipClient(super.firstName, super.lastName);
}

class RegularClient extends Client {
  RegularClient(super.firstName, super.lastName);
}