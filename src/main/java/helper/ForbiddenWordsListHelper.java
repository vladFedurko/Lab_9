package helper;

import entity.UserList;

import javax.servlet.ServletContext;
import java.io.*;
import java.nio.charset.StandardCharsets;
import java.util.HashSet;

public abstract class ForbiddenWordsListHelper {

    // Относительный путь к файлу, в котором хранятся данные о пользователях
    private static final String WORDS_FILENAME = "WEB-INF/forbiddenWords.dat";

    // Полный путь к файлу, в котором хранятся данные о пользователях
    private static String WORDS_PATH = null;

    // Читает данные пользователей из файла хранилища и формирует на их основе объект UserList.
    public static HashSet<String> readWordsList(ServletContext context) {
        try {
            // Определяем физический путь к файлу
            WORDS_PATH = context.getRealPath(WORDS_FILENAME);
            // Создаем объектный поток ввода на основе файлового потока

            HashSet<String> words = new HashSet<String>(10);

            try (BufferedReader reader = new BufferedReader(
                    new InputStreamReader(
                            new FileInputStream(WORDS_PATH), StandardCharsets.UTF_8))){
                String line;
                while ((line = reader.readLine()) != null) {
                    words.add(line);
                }
            } catch (IOException e) {
                // log error
            }
            return words;
        } catch (Exception e) {
            // Если возникли проблемы с чтением из файла, возвращаем пустой список
            return new HashSet<>();
        }
    }


}