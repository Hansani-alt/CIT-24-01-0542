from flask import Flask
import mysql.connector
import os

app = Flask(__name__)

@app.route("/")
def home():
    try:
        connection = mysql.connector.connect(
            host=os.getenv("DB_HOST", "database"),
            user=os.getenv("DB_USER", "root"),
            password=os.getenv("DB_PASSWORD", "password"),
            database=os.getenv("DB_NAME", "appdb")
        )

        cursor = connection.cursor()

        cursor.execute("""
            CREATE TABLE IF NOT EXISTS visits (
                id INT AUTO_INCREMENT PRIMARY KEY,
                message VARCHAR(255)
            )
        """)

        cursor.execute(
            "INSERT INTO visits (message) VALUES ('Application accessed successfully')"
        )

        connection.commit()

        cursor.execute("SELECT COUNT(*) FROM visits")
        count = cursor.fetchone()[0]

        cursor.close()
        connection.close()

        return f"""
        <h1>Docker Web Application</h1>
        <p>Web service is running successfully!</p>
        <p>Database is connected successfully!</p>
        <p>Total visits recorded: {count}</p>
        """

    except Exception as e:
        return f"<h1>Database connection error</h1><p>{str(e)}</p>"


if __name__ == "__main__":
    app.run(host="0.0.0.0", port=5000)
