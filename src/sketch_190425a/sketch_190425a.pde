// The data from the Table object will fill the array of Bubble objects
Table table;

void setup() {
  size(480, 360);
  loadData();
}

void draw() {
  background(255);
}

void loadData() {
  // "header" indicates the file has header row. The size of the array 
  // is then determined by the number of rows in the table. 
  table = loadTable("records_new.csv", "header");


  for (int i = 0; i<table.getRowCount(); i++) {
    // Iterate over all the rows in a table.
    TableRow row = table.getRow(i);

  
    // Access the fields via their column name (or index).
    int ts = row.getInt("Timestamp");
    String type = row.getString("Type");
    String d = row.getString("Categories");
    float n = row.getFloat("Money");
  }
}
