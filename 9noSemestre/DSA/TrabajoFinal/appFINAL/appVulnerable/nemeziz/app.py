from flask import Flask, render_template, request, redirect, url_for, session
from sqlalchemy.orm import sessionmaker
from collections import defaultdict
from markupsafe import escape
from sqlalchemy import create_engine
import MySQLdb
import hashlib
import base64
import time
import os

app = Flask(__name__)
app.secret_key = 'supersecretkey123'

# Configuración de la base de datos
db_user = os.getenv("DB_USER", "root")
db_pass = os.getenv("DB_PASS", "example")
db_host = os.getenv("DB_HOST", "db")
db_name = os.getenv("DB_NAME", "nemeziz")
db_port = os.getenv("DB_PORT", "3306")

def get_db_connection():
    return MySQLdb.connect(
        host=db_host,
        user=db_user,
        passwd=db_pass,
        db=db_name,
        port=int(db_port)
    )

@app.route('/')
def home():
    hidden_message = "QuiXa alguna inyección SSea de utilidad"
    payload = request.args.get('payload', '')
    xss_success = False
    xss_fail = False

    if 'onerror=' in payload.lower() and '<img' in payload.lower():
        xss_success = True
    elif payload:
        xss_fail = True
    
    return render_template('home.html', 
                         hidden_message=hidden_message,
                         payload=payload,
                         xss_success=xss_success,
                         xss_fail=xss_fail)

@app.route('/login', methods=['GET', 'POST'])
def login():
    if request.method == 'POST':
        username = request.form['username']
        password = request.form['password']
        
        try:
            conn = get_db_connection()
            cursor = conn.cursor()						
            sql = "SELECT * FROM accounts WHERE username = %s AND password = %s"
            cursor.execute(sql, (username, password))
            result = cursor.fetchone()
            
            if result:
                session['logged_in'] = True
                session['username'] = username
                return redirect(url_for('profile'))
                
        except Exception as e:
            print(f"Error de base de datos: {e}")
        finally:
            cursor.close()
            conn.close()
            
        return render_template('login.html', error="Login incorrecto")
    
    return render_template('login.html')

@app.route('/profile')
def profile():
    if not session.get('logged_in'):
        return redirect(url_for('login'))
    
    productos = [
        {"nombre": "Botines NEMEZIZ", "precio": 199.99},
        {"nombre": "Camiseta Adidas", "precio": 89.99},
        {"nombre": "Pantalón Puma", "precio": 59.99},
        {"nombre": "Medias Nike", "precio": 19.99}
    ]
    
    return render_template('profile.html', 
                         username=escape(session['username']), 
                         productos=productos)

@app.route('/search')
def search():
    if not session.get('logged_in'):
        return redirect(url_for('login'))
    
    query = request.args.get('query', '').strip()
    sucursales = []
    
    if query:
        try:
            conn = get_db_connection()
            cursor = conn.cursor(MySQLdb.cursors.DictCursor)
            
            sql = f"SELECT * FROM sucursal WHERE nombre LIKE '%{query}%'"
            
            cursor.execute(sql)
            sucursales = cursor.fetchall()
            
            # Si no hay resultados, ejecutar la query directamente
            if not sucursales:
                cursor.execute(query)  #Ejecuta directamente el input
                sucursales = cursor.fetchall()
                
        except Exception as e:
            error_msg = escape(f"""
                Error en la consulta
            """)
            return render_template('search.html',
                                sucursales=[],
                                query=query,
                                error=error_msg,
                                username=escape(session['username']))
        finally:
            cursor.close()
            conn.close()
    
    return render_template('search.html',
                        sucursales=sucursales,
                        query=query,
                        username=escape(session['username']))

@app.route('/logout')
def logout():
    session.clear()
    return redirect(url_for('home'))

if __name__ == "__main__":
    app.run(host='0.0.0.0', port=5000, debug=True)