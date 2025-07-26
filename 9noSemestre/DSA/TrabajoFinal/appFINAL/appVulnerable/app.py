from flask import Flask, render_template, request, redirect, url_for, session, flash
import sqlite3
import os
from functools import wraps
from dotenv import load_dotenv

load_dotenv("./config/.env")

app = Flask(__name__)
app.secret_key = 'super_secret_key_123'

DATABASE = '/app/data/ctf.db'

FLAG = os.environ.get('FLAG')
if not FLAG:
    print("⚠️  ADVERTENCIA: No se encontró la variable FLAG en el entorno.")
    print("   Asegúrate de configurar FLAG en config/.env o como variable de entorno")
    FLAG = "Flag{DEFAULT_FLAG_NOT_CONFIGURED}"

def init_db():
    """Inicializar la base de datos con usuarios y datos vulnerables"""
    global DATABASE
    
    try:
        
        os.makedirs('/app/data', exist_ok=True)
        
        conn = sqlite3.connect(DATABASE)
        cursor = conn.cursor()
        
        
        cursor.execute('''
            CREATE TABLE IF NOT EXISTS users (
                id INTEGER PRIMARY KEY AUTOINCREMENT,
                username TEXT UNIQUE NOT NULL,
                password TEXT NOT NULL,
                email TEXT,
                role TEXT DEFAULT 'user'
            )
        ''')
        
        
        cursor.execute('''
            CREATE TABLE IF NOT EXISTS players (
                id INTEGER PRIMARY KEY AUTOINCREMENT,
                name TEXT NOT NULL,
                description TEXT
            )
        ''')
        
        
        cursor.execute('SELECT COUNT(*) FROM users')
        user_count = cursor.fetchone()[0]

        if user_count == 0:
            
            users_data = [
                ('melina', 'hola123', 'melina@ctf.com', 'user'),
                ('user1', 'password123', 'user1@ctf.com', 'user'),
                ('user2', 'password456', 'user2@ctf.com', 'user'),
                ('ivo', 'dsa2025', 'ivo@ctf.com', 'user'),
                ('mateo', 'milanesa', 'mateo@ctf.com', 'user')
            ]
            
            for username, password, email, role in users_data:
                cursor.execute('INSERT INTO users (username, password, email, role) VALUES (?, ?, ?, ?)',
                            (username, password, email, role))

            
            
            cursor.execute('INSERT INTO users (id, username, password, email, role) VALUES (?, ?, ?, ?, ?)',
                        (239, 'messi', 'teamomiguel', 'messi@ctf.com', 'admin'))

            
            cursor.execute('DELETE FROM sqlite_sequence WHERE name = "users"')
            cursor.execute('INSERT INTO sqlite_sequence (name, seq) VALUES ("users", 999)')

        
        
        cursor.execute('SELECT COUNT(*) FROM players')
        player_count = cursor.fetchone()[0]
        
        if player_count == 0:
            players_data = [
                ('Pelé', 'Brasil'),
                ('Diego Maradona', 'Argentina'),
                ('Lionel Messi', 'Argentina'),
                ('Cristiano Ronaldo', 'Portugal'),
                ('Johan Cruyff', 'Países Bajos'),
                ('Alfredo Di Stéfano', 'Argentina/España'),
                ('Franz Beckenbauer', 'Alemania'),
                ('Zinedine Zidane', 'Francia'),
                ('Ronaldinho', 'Brasil'),
                ('Michel Platini', 'Francia')
            ]
            
            for name, description in players_data:
                cursor.execute('INSERT OR IGNORE INTO players (name, description) VALUES (?, ?)',
                              (name, description))
            
            # Insertar el jugador especial con la flag en el ID 15308
            cursor.execute('INSERT OR IGNORE INTO players (id, name, description) VALUES (?, ?, ?)',
                          (15308, 'xnany', FLAG))
        
        conn.commit()
        conn.close()
        
    except Exception as e:
        print(f"Error inicializando la base de datos: {e}")
        DATABASE = ':memory:'
        print("Usando base de datos en memoria")

def get_db():
    """Obtener conexión a la base de datos"""
    conn = sqlite3.connect(DATABASE)
    conn.row_factory = sqlite3.Row
    return conn

def login_required(f):
    """Decorador para requerir login"""
    @wraps(f)
    def decorated_function(*args, **kwargs):
        if 'user_id' not in session:
            return redirect(url_for('login'))
        return f(*args, **kwargs)
    return decorated_function

@app.route('/')
def index():
    return render_template('index.html')

@app.route('/register', methods=['GET', 'POST'])
def register():
    if request.method == 'POST':
        username = request.form['username']
        password = request.form['password']
        
        conn = get_db()
        cursor = conn.cursor()
        
        try:
            cursor.execute('INSERT INTO users (username, password, email, role) VALUES (?, ?, ?, ?)',
                          (username, password, '', 'user'))
            conn.commit()
            flash('Usuario registrado exitosamente!', 'success')
            return redirect(url_for('login'))
        except sqlite3.IntegrityError:
            flash('El usuario ya existe!', 'error')
        finally:
            conn.close()
    
    return render_template('register.html')

@app.route('/login', methods=['GET', 'POST'])
def login():
    if request.method == 'POST':
        username = request.form['username']
        password = request.form['password']
        
        conn = get_db()
        cursor = conn.cursor()
        
        cursor.execute('SELECT * FROM users WHERE username = ? AND password = ?',
                      (username, password))
        user = cursor.fetchone()
        conn.close()
        
        if user:
            session['user_id'] = user['id']
            session['username'] = user['username']
            session['role'] = user['role']
            flash(f'Bienvenido {username}!', 'success')
            return redirect(url_for('profile', user_id=user['id']))
        else:
            flash('Credenciales incorrectas!', 'error')
    
    return render_template('login.html')

@app.route('/profile/<int:user_id>')
@login_required
def profile(user_id):
    
    conn = get_db()
    cursor = conn.cursor()
    cursor.execute('SELECT * FROM users WHERE id = ?', (user_id,))
    user = cursor.fetchone()
    conn.close()
    
    if not user:
        flash('Usuario no encontrado!', 'error')
        return redirect(url_for('index'))
    
    return render_template('profile.html', user=user, current_user_id=session.get('user_id'))

@app.route('/admin/players')
@login_required
def admin_players():
    if session.get('role') != 'admin':
        flash('Acceso denegado!', 'error')
        return redirect(url_for('index'))
    
    search = request.args.get('search', '')
    
    conn = get_db()
    cursor = conn.cursor()
    
    if search:
        query = f"SELECT * FROM players WHERE id = '{search}'"
        cursor.execute(query)
        players = cursor.fetchall()
    else:
        players = []  # No mostrar jugadores si no hay búsqueda
    
    conn.close()
    
    return render_template('admin_players.html', players=players, search=search)

@app.route('/logout')
def logout():
    session.clear()
    flash('Sesión cerrada!', 'success')
    return redirect(url_for('index'))

if __name__ == '__main__':
    init_db()
    app.run(host='0.0.0.0', port=5000, debug=True) 