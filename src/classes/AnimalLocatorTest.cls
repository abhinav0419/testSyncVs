@isTest
public class AnimalLocatorTest {
    @isTest static void testingAnimal(){
        Test.setMock(HttpCalloutMock.class, new AnimalLocatorMock());
        string result = AnimalLocator.getAnimalNameById(1);
        String expectedResult = 'chicken';
        System.assertEquals(result,expectedResult );
    }
}