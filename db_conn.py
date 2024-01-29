import sqlite3


class Database:
    
    def __init__(self, db_file):
        self._con = sqlite3.connect(db_file)
        self._cursor = self._con.cursor()

    def __enter__(self):
        return self

    def __exit__(self, exc_type, exc_val, exc_tb):
        self.close()

    @property
    def connection(self):
        return self._con
    
    @property
    def cursor(self):
        return self._cursor

    def query(self, sql, params=None):
        self.cursor.execute(sql, params or ())
        return self.cursor.fetchall()

    def query_many(self, sql, params=None):
        self.cursor.executemany(sql, params or ())
        return self.cursor.fetchall()
    
    def execute(self, sql, params=None):
        self.cursor.execute(sql, params or ())

    def close(self, commit=True):
        if commit:
            self.commit()
        self.cursor.close()
    
    def commit(self):
        self.connection.commit()
