package helper;

import entity.UserList;

import javax.servlet.ServletContext;
import java.io.*;
import java.nio.charset.StandardCharsets;
import java.util.HashSet;

public abstract class ForbiddenWordsListHelper {

    // ������������� ���� � �����, � ������� �������� ������ � �������������
    private static final String WORDS_FILENAME = "WEB-INF/forbiddenWords.dat";

    // ������ ���� � �����, � ������� �������� ������ � �������������
    private static String WORDS_PATH = null;

    // ������ ������ ������������� �� ����� ��������� � ��������� �� �� ������ ������ UserList.
    public static HashSet<String> readWordsList(ServletContext context) {
        try {
            // ���������� ���������� ���� � �����
            WORDS_PATH = context.getRealPath(WORDS_FILENAME);
            // ������� ��������� ����� ����� �� ������ ��������� ������

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
            // ���� �������� �������� � ������� �� �����, ���������� ������ ������
            return new HashSet<>();
        }
    }


}