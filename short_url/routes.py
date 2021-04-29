from flask import Blueprint, request, redirect, jsonify
from datetime import timedelta, date

from short_url import db
from .models import Link

short = Blueprint('short', __name__)


@short.route('/add_link', methods=['POST'])
def add_link():
    original_url = request.get_json().get("original_url")
    expiration_date = request.get_json().get("expiration_date", 90)
    if expiration_date < 1 or expiration_date > 365:
        return 'Bad Request!', 400
    link = Link(original_url=original_url, expiration_date=date.today() + timedelta(expiration_date))
    db.session.add(link)
    db.session.commit()

    return jsonify(short_url=link.short_url)


@short.route('/<short_url>')
def redirect_to_url(short_url):
    link = Link.query.filter(Link.short_url == short_url).filter(Link.expiration_date >= date.today()).first_or_404()
    return redirect(link.original_url)
