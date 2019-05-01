import java.io.*;
import java.nio.file.*;
import java.util.ArrayList;

public class DeleteItemHelper {
    private Tools tools;
    
    private DeleteItemHelper(){
        tools = new Tools();
    }
    
    /**
     * Delete Contents in CSV File. Will Create A New File and Delete the Old One
     * @param fileName Target CSV File Name
     * @param contents String To Delete from CSV File
     */
    public void deleteFileContent(String fileName, String contents) {

        ArrayList<String> results = new ArrayList<String>();
        BufferedReader bd = null;
        String line = "";

        try {

            bd = new BufferedReader(new FileReader(fileName));

            while((line = bd.readLine()) != null) {

                if(matchToDelete(line, contents)){
                    //pass this line
                } else {
                    if(line.trim() != ""){
                        results.add(line);
                    }
                }
            }

            writeFile(fileName, results);

        } catch (IOException e) {
            e.printStackTrace();
        } finally {
            if(bd != null) {
                try {
                    bd.close();
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
        }

    }


    /**
     * Delete Helper. Find the Right Record Line to Delete
     * @param contents String From File Line
     * @param contents String To Delete from CSV File
     */
    public boolean matchToDelete(String fromFile,String delete){
        String[] recordLine = fromFile.split(",");
        String[] deleteLine = delete.split(",");
        boolean match = true;
        
        String date = recordLine[0];
        date = tools.getDate(date).trim();
        
        if(!date.substring(0,10).equals(deleteLine[0])){
            match = false;
        }
        
        for (int i = 1; i < 4;i++){
            if (!recordLine[i].equals(deleteLine[i])){
                match = false;
            }
        }
        
        return match;
    };

    /**
     * Read CSV File And Return An ArrayList of Accounts
     *
     * @param fileName The Name Of CSV File
     * @return [String] results
     */
    public ArrayList<String> readFile(String fileName) {

        ArrayList<String> results = new ArrayList<String>();
        BufferedReader br = null;
        String line = "";

        try {

            br = new BufferedReader(new FileReader(fileName));

            while((line = br.readLine()) != null) {
                if(line.trim() != "")
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
    public void writeFile(String fileName, ArrayList<String> contents) {

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

}
