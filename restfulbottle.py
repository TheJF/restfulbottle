import bottle
import json
from pymongo import Connection
from bottle import get, post, request, route, run, jinja2_view as view, jinja2_template as template


# !! Default config and initializations !!
connection = Connection('localhost', 27017)
db = connection['restfulbottle']
pages = db['pages']


# !! Routes !!
@route('/')
def index():
	return 'Hello world!'

@route('/wikis')
def view_all_wikis():
   all_pages = pages.find()
   return template('views/show_all_wiki.tpl', all_pages=all_pages)

@get('/wikis/<name>')
def view_wiki(name=''):
   # find the request document in Mongo and serve it back as a page
   page = pages.find_one({'name':name})

   # if this wiki page doesn't exist, show a create new wiki page
   if page is None:
      return template('views/create_wiki.tpl', name=name)

   return template('views/show_wiki.tpl', page=page)

@post('/wikis/<name>')
def view_wiki(name=''):
   # grab the content data from the POST
   new_content = request.forms.get('content')

   # replace the previous Mongo document.
   # why not update? This rolls creating/editing into one operation.
   pages.update({'name':name}, {'name': name, 'content': new_content}, True)

   # load up the updated document and serve it back as a page
   page = pages.find_one({'name':name})
   return template('views/show_wiki.tpl', page=page)

@route('/wikis/<name>/edit')
def view_wiki(name=''):
   page = pages.find_one({'name':name})
   return template('views/edit_wiki.tpl', page=page)

@route('/wikis/<name>/delete')
def delete_wiki(name=''):
   deleted_page = pages.remove({'name': name})
   return template ('views/delete_wiki.tpl', name=name)


bottle.debug(True)
run()