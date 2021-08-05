import 'package:intl/intl.dart';

void main(List<String> arguments) {
  var schedule = Schedule();

  var address1 = Address('Rua 1', '1', 'Bairro 1');
  var address2 = Address('Rua 2', '2', 'Bairro 2');

  final now = DateTime.now();
  final formatter = DateFormat('dd/MM/yyyy');
  final createdAt = formatter.format(now);

  var person1 = PersonalContact('Fulano', '11111111', createdAt, address1);
  var person2 = PersonalContact('Sicrano', '22222222', createdAt, address2);
  var person3 = ProfessionalContact('Beltrano', '33333333', createdAt, 'Beltrano Companys');
  var person4 = ProfessionalContact('Jorge kkk', '44444444', createdAt, 'Jorge Companys');

  schedule.addContact(person1);
  schedule.addContact(person2);

  schedule.addContact(person3);
  schedule.addContact(person4);

  schedule.deleteContact(person4);

  schedule.showAllContacts();

  schedule.findContact(person1);
  schedule.findContact(person4);
}

abstract class Contact {
  String name;
  String phone;
  String created_at;

  Contact(this.name, this.phone, this.created_at);
}

class ProfessionalContact extends Contact {
  String company;

  ProfessionalContact(String name, String phone, String created_at, this.company) : super(name, phone, created_at);
}

class PersonalContact extends Contact {
  Address address;

  PersonalContact(String name, String phone, String created_at, this.address) : super(name, phone, created_at);
}

class Address {
  String street;
  String houseNumber;
  String neighborhood;

  Address(this.street, this.houseNumber, this.neighborhood);
}

class Schedule {
  List<PersonalContact> personalContacts = [];
  List<ProfessionalContact> professionalContacts = [];

  void addContact(Contact contact) {
    if (contact is PersonalContact) {
      personalContacts.add(contact);
    }
    
    if (contact is ProfessionalContact) {
      professionalContacts.add(contact);
    }
  }

  void deleteContact(Contact contact) {
    if (contact is PersonalContact) {
      personalContacts.remove(contact);
    }
    
    if (contact is ProfessionalContact) {
      professionalContacts.remove(contact);
    }
  }

  void showAllContacts() {
    print('Contatos pessoais:');
    personalContacts.forEach((contact) => {
      print('${contact.name} - ${contact.phone} - ${contact.created_at} - ${contact.address.street} - ${contact.address.houseNumber} - ${contact.address.neighborhood}')
    });
    print('---------------\n');

    print('Contatos profissionais:');
    professionalContacts.forEach((contact) => {
      print('${contact.name} - ${contact.phone} - ${contact.created_at} - ${contact.company}')
    });
    print('---------------\n\n\n');
  }

  void findContact(Contact contact) {
    var contactFound = false;

    if (contact is PersonalContact) {
      if (personalContacts.contains(contact)) {
        contactFound = true;
      }
    }
    
    if (contact is ProfessionalContact) {
      
      if (professionalContacts.contains(contact)) {
        contactFound = true;
      }
    }

    if (contactFound) {
      print('O contato existe na agenda!');
    } else {
      print('O contato não existe na agenda.');
    }
  }
}
