import string
from random import choices

from short_url import db


class Link(db.Model):
    id = db.Column(db.Integer, primary_key=True)
    original_url = db.Column(db.String(512))
    short_url = db.Column(db.String(50), unique=True, index=True)
    expiration_date = db.Column(db.Date)

    def __init__(self, **kwargs):
        super().__init__(**kwargs)
        self.short_url = self.generate_short_url()

    def generate_short_url(self):
        characters = string.digits + string.ascii_letters
        short_url = ''.join(choices(characters, k=5))
        link = self.query.filter_by(short_url=short_url).first()

        if link:
            return self.generate_short_url()

        return short_url
