
# **Sportserve ETL Pipeline**

## **Overview**
The **Sportserve ETL Pipeline** is a data engineering project designed to extract, transform, and load (ETL) data from CSV files into a SQL Server database. The pipeline performs user data processing to identify common user properties, detect fuzzy connections (similarities) between users, and visualize the results for analysis.

### **Project Details**
- **Data Source**: Two CSV files (`users01.csv`, `users02.csv`).
- **Database**: SQL Server.
- **Libraries Used**: pandas, numpy, matplotlib, seaborn, SQLAlchemy, pyodbc, psycopg2.
- **Tasks Performed**:
  1. Read CSV files into pandas DataFrames.
  2. Insert data into SQL Server database.
  3. Analyze user data for common properties and fuzzy connections.
  4. Visualize the results using Python's `matplotlib` and `seaborn`.

---

## **Installation**

### **Prerequisites**
Ensure you have the following software installed on your system:
- **Python 3.x**
- **SQL Server** or any compatible database.
- **Libraries**:
  - pandas
  - numpy
  - matplotlib
  - seaborn
  - psycopg2
  - sqlalchemy
  - pyodbc

You can install the required Python libraries using `pip`:

```bash
pip install pandas numpy matplotlib seaborn psycopg2 sqlalchemy pyodbc
```

### **Setting up the Database**
1. **SQL Server**: The project is designed to work with a **SQL Server** database. You must have access to a **SQL Server instance**.
2. **Create the Database**: You need to create a database where the tables will be inserted. You can create the `Sportserve` database via SQL Server Management Studio (SSMS) or using SQL commands.
3. **Database Connection String**: Modify the connection string inside the notebook to match your database credentials. You can find this in the code cell where the connection string is set:

```python
conn_str = (
    r"DRIVER={ODBC Driver 17 for SQL Server};"
    r"Server=localhost\SQLEXPRESS;"
    r"Database=Sportserve;"
    r"Trusted_Connection=yes;"
)
```

---

## **Project Workflow**

### **1. Load Data from CSV Files**
The project begins by reading two CSV files: `users01.csv` and `users02.csv`.

```python
users_01 = pd.read_csv("users01.csv")
users_02 = pd.read_csv("users02.csv")
```

### **2. Inspect Data**
Data inspection is done to verify the columns in the CSV files.

```python
print("users01 shape:", users_01.shape)
print("users02 shape:", users_02.shape)
```

### **3. Insert Data into SQL Server**
Once the data is read into pandas DataFrames, it's inserted into the SQL Server database into tables `sports_user1` and `sports_user2`.

```python
users_01.to_sql('sports_user1', con=engine, if_exists='replace', index=False)
users_02.to_sql('sports_user2', con=engine, if_exists='replace', index=False)
```

### **4. Data Analysis**
The user data is then analyzed to find common properties and fuzzy connections (similarities) between users.

### **5. Visualize Results**
Results can be visualized using Python libraries such as `matplotlib` and `seaborn` for analysis representation.

---

## **How to Use**

### **1. Clone the Repository**
Clone this repository to your local machine:

```bash
git clone https://github.com/doncoding-ai/Sportserve.git
```

### **2. Run the Notebook**
Open the Jupyter notebook (`Sportserve_etl.ipynb`) in your preferred environment (Jupyter, VS Code, etc.) and follow the steps outlined in the notebook to execute the pipeline.

### **3. View Results**
Once the ETL process is complete, the results of the analysis (common user properties, similarities) will be visible in the notebook. Visualizations will also be rendered to help interpret the findings.

---

## **Potential Improvements**
- **Error Handling**: Add more robust error handling for database connections and data inserts.
- **Transformations**: Improve data transformations to account for different data sources.
- **Scalability**: Implement more scalable solutions for handling large datasets.
- **Scheduling**: Implement job scheduling using tools like Airflow or cron to run this ETL pipeline automatically on a regular basis.

---

## **License**
This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

---

## **Contact**
- **Author**: Elijah Ndeto
- **Email**: [elito1236@gmail.com]
