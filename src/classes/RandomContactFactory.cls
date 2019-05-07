public class RandomContactFactory {
    public static List<Contact>generateRandomContacts(Integer numOfContacts, String lastName) {
        List<Contact> contactList = new List<Contact>();
        for(Integer i = 0; i < numOfContacts ; i++){
            Contact cnt = new Contact(FirstName = 'xyz'+i, LastName = lastName);
            contactList.add(cnt);
        }
        return contactList;
    }
}