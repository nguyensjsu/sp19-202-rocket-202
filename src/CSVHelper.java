import java.io.*;
import java.nio.file.*;
import java.util.ArrayList;

public final class CSVHelper {

    /**
     * Read CSV File And Return An ArrayList of Accounts
     *
     * @param fileName The Name Of CSV File
     * @return [String] results
     */
    public static ArrayList<String> readFile(String fileName) {

        ArrayList<String> results = new ArrayList<>();
        BufferedReader br = null;
        String line = "";

        try {

            br = new BufferedReader(new FileReader(fileName));

            while((line = br.readLine()) != null) {
                results.add(line);
            }

        } catch (FileNotFoundException e) {
            System.out.println(fileName + " doesn't exist, return a empty ArrayList.");
            return results;
        } catch (IOException e) {
            e.printStackTrace();
        } finally {
            if(br != null) {
                try {
                    br.close();
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
        }

        return results;

    }

    /**
     * Write Contents to CSV File. Will Replace The File If The File Already Exists
     * @param fileName Target CSV File Name
     * @param contents Strings To Write Into CSV File
     */
    public static void writeFile(String fileName, ArrayList<String> contents) {

        BufferedWriter bw = null;

        try {

            File file = new File(fileName);

            Files.deleteIfExists(file.toPath());
            file.createNewFile();

            bw = new BufferedWriter(new FileWriter(file, true));

            for(String s : contents) {
                bw.write(s);
                bw.newLine();
            }


        } catch (IOException e) {
            e.printStackTrace();
        } finally {
            if(bw != null) {
                try {
                    bw.close();
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
        }

    }

    /**
     * Append A New String To CSV File
     * @param fileName Target CSV File Name
     * @param content Target String To Append
     */
    public static void appendFile(String fileName, String content) {

        BufferedWriter bw = null;

        try {

            File file = new File(fileName);

            if(!file.exists())
                file.createNewFile();

            bw = new BufferedWriter(new FileWriter(file, true));

            bw.write(content);
            bw.newLine();


        } catch (IOException e) {
            e.printStackTrace();
        } finally {
            if(bw != null) {
                try {
                    bw.close();
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
        }

    }

    /**
     * Delete CSV File
     * @param fileName Target CSV File Name
     */
    public static void deleteFile(String fileName) {

        try {
            Files.deleteIfExists(Paths.get(fileName));
        } catch (IOException e) {
            System.err.println("Permission error. Skipping");
        }

    }

}
