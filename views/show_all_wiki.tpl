<!DOCTYPE html>
<html lang="en">
	<head>
		<meta charset="utf-8" />
		<title>RESTful Bottle Wiki: Wikis</title>
	</head>

	<body id="home">
		<h2>Wiki Entries</h2>
		<ul>
		{% for page in all_pages %}
			<li><a href="/wikis/{{ page.name }}">{{ page.name }}</a></li>
		{% endfor %}
		</ul>
	</body>
</html>