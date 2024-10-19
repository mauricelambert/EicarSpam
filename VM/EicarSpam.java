import java.io.FileWriter;
import java.io.IOException;

public class EicarSpam {
    public static void main(String[] args) {
        String baseFileName = "file_";
        String part2 = "!$H+H*";
        String part1 = "X5O!P%@AP[4\\PZX54(P^)7CC)7}$";
        String eicar = part1 + "EICAR-STANDARD-ANTIVIRUS-TEST-FILE" + part2;

        for (int i = 1; i <= 300; i++) {
            String fileName = baseFileName + i + ".txt";
            writeFile(fileName, eicar);
        }
    }

    public static void writeFile(String fileName, String content) {
        try (FileWriter fileWriter = new FileWriter(fileName)) {
            fileWriter.write(content);
        } catch (IOException e) {
            System.out.println("An error occurred while writing to file: " + fileName);
            e.printStackTrace();
        }
    }
}
