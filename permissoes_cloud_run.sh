
Logs

build
container



===== Application Startup at 2025-04-02 05:51:46 =====

[2025-04-02 05:51:52 +0000] [1] [INFO] Starting gunicorn 21.2.0
[2025-04-02 05:51:52 +0000] [1] [INFO] Listening at: http://0.0.0.0:7860 (1)
[2025-04-02 05:51:52 +0000] [1] [INFO] Using worker: sync
[2025-04-02 05:51:52 +0000] [7] [INFO] Booting worker with pid: 7
[2025-04-02 05:51:54,740] ERROR in app: Exception on / [GET]
Traceback (most recent call last):
  File "/usr/local/lib/python3.10/site-packages/flask/app.py", line 2529, in wsgi_app
    response = self.full_dispatch_request()
  File "/usr/local/lib/python3.10/site-packages/flask/app.py", line 1825, in full_dispatch_request
    rv = self.handle_user_exception(e)
  File "/usr/local/lib/python3.10/site-packages/flask/app.py", line 1823, in full_dispatch_request
    rv = self.dispatch_request()
  File "/usr/local/lib/python3.10/site-packages/flask/app.py", line 1799, in dispatch_request
    return self.ensure_sync(self.view_functions[rule.endpoint])(**view_args)
  File "/app/app.py", line 66, in index
    return render_template("pagina1.html", campos=campos, opcoes=opcoes)
  File "/usr/local/lib/python3.10/site-packages/flask/templating.py", line 146, in render_template
    template = app.jinja_env.get_or_select_template(template_name_or_list)
  File "/usr/local/lib/python3.10/site-packages/jinja2/environment.py", line 1087, in get_or_select_template
    return self.get_template(template_name_or_list, parent, globals)
  File "/usr/local/lib/python3.10/site-packages/jinja2/environment.py", line 1016, in get_template
    return self._load_template(name, globals)
  File "/usr/local/lib/python3.10/site-packages/jinja2/environment.py", line 975, in _load_template
    template = self.loader.load(self, name, self.make_globals(globals))
  File "/usr/local/lib/python3.10/site-packages/jinja2/loaders.py", line 126, in load
    source, filename, uptodate = self.get_source(environment, name)
  File "/usr/local/lib/python3.10/site-packages/flask/templating.py", line 62, in get_source
    return self._get_source_fast(environment, template)
  File "/usr/local/lib/python3.10/site-packages/flask/templating.py", line 98, in _get_source_fast
    raise TemplateNotFound(template)
jinja2.exceptions.TemplateNotFound: pagina1.html
[2025-04-02 09:14:48,636] ERROR in app: Exception on / [GET]
Traceback (most recent call last):
  File "/usr/local/lib/python3.10/site-packages/flask/app.py", line 2529, in wsgi_app
    response = self.full_dispatch_request()
  File "/usr/local/lib/python3.10/site-packages/flask/app.py", line 1825, in full_dispatch_request
    rv = self.handle_user_exception(e)
  File "/usr/local/lib/python3.10/site-packages/flask/app.py", line 1823, in full_dispatch_request
    rv = self.dispatch_request()
  File "/usr/local/lib/python3.10/site-packages/flask/app.py", line 1799, in dispatch_request
    return self.ensure_sync(self.view_functions[rule.endpoint])(**view_args)
  File "/app/app.py", line 66, in index
    return render_template("pagina1.html", campos=campos, opcoes=opcoes)
  File "/usr/local/lib/python3.10/site-packages/flask/templating.py", line 146, in render_template
    template = app.jinja_env.get_or_select_template(template_name_or_list)
  File "/usr/local/lib/python3.10/site-packages/jinja2/environment.py", line 1087, in get_or_select_template
    return self.get_template(template_name_or_list, parent, globals)
  File "/usr/local/lib/python3.10/site-packages/jinja2/environment.py", line 1016, in get_template
    return self._load_template(name, globals)
  File "/usr/local/lib/python3.10/site-packages/jinja2/environment.py", line 975, in _load_template
    template = self.loader.load(self, name, self.make_globals(globals))
  File "/usr/local/lib/python3.10/site-packages/jinja2/loaders.py", line 126, in load
    source, filename, uptodate = self.get_source(environment, name)
  File "/usr/local/lib/python3.10/site-packages/flask/templating.py", line 62, in get_source
    return self._get_source_fast(environment, template)
  File "/usr/local/lib/python3.10/site-packages/flask/templating.py", line 98, in _get_source_fast
    raise TemplateNotFound(template)
jinja2.exceptions.TemplateNotFound: pagina1.html
[2025-04-02 09:14:49,735] ERROR in app: Exception on / [GET]
Traceback (most recent call last):
  File "/usr/local/lib/python3.10/site-packages/flask/app.py", line 2529, in wsgi_app
    response = self.full_dispatch_request()
  File "/usr/local/lib/python3.10/site-packages/flask/app.py", line 1825, in full_dispatch_request
    rv = self.handle_user_exception(e)
  File "/usr/local/lib/python3.10/site-packages/flask/app.py", line 1823, in full_dispatch_request
    rv = self.dispatch_request()
  File "/usr/local/lib/python3.10/site-packages/flask/app.py", line 1799, in dispatch_request
    return self.ensure_sync(self.view_functions[rule.endpoint])(**view_args)
  File "/app/app.py", line 66, in index
    return render_template("pagina1.html", campos=campos, opcoes=opcoes)
  File "/usr/local/lib/python3.10/site-packages/flask/templating.py", line 146, in render_template
    template = app.jinja_env.get_or_select_template(template_name_or_list)
  File "/usr/local/lib/python3.10/site-packages/jinja2/environment.py", line 1087, in get_or_select_template
    return self.get_template(template_name_or_list, parent, globals)
  File "/usr/local/lib/python3.10/site-packages/jinja2/environment.py", line 1016, in get_template
    return self._load_template(name, globals)
  File "/usr/local/lib/python3.10/site-packages/jinja2/environment.py", line 975, in _load_template
    template = self.loader.load(self, name, self.make_globals(globals))
  File "/usr/local/lib/python3.10/site-packages/jinja2/loaders.py", line 126, in load
    source, filename, uptodate = self.get_source(environment, name)
  File "/usr/local/lib/python3.10/site-packages/flask/templating.py", line 62, in get_source
    return self._get_source_fast(environment, template)
  File "/usr/local/lib/python3.10/site-packages/flask/templating.py", line 98, in _get_source_fast
    raise TemplateNotFound(template)
jinja2.exceptions.TemplateNotFound: pagina1.html
