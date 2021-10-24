package Helpers;

import com.github.javafaker.Faker;

public class DataGenerator {
    public static int getRandomNumber() {
        Faker faker = new Faker();
        int strNum = faker.random().nextInt(0, 100);
        return strNum;
    }

    public static String getRandomContent(){
        Faker faker = new Faker();
        String contentStr = "";
        contentStr = faker.superhero().name();
        contentStr += " Is Superhero";
        return contentStr;
    }
}
