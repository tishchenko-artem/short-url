from threading import Thread
from flask import Flask
import time
import sqlite3
import os

from short_url.extensions import db
from short_url.routes import short
from short_url.models import Link


def threaded_task():
    while True:
        conn = sqlite3.connect(os.environ.get('DATABASE_URL_DIRECT'), check_same_thread=False)
        cursor = conn.cursor()
        sql = "DELETE FROM link WHERE expiration_date < date('now')"
        cursor.execute(sql)
        conn.commit()
        conn.close()
        time.sleep(86400)


def create_app(config='settings.py'):
    app = Flask(__name__)

    app.config.from_pyfile(config)

    db.init_app(app)

    app.register_blueprint(short)

    thread = Thread(target=threaded_task)
    thread.daemon = True
    thread.start()

    return app
