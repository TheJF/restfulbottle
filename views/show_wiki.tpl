<!DOCTYPE html>
<html lang="en">
	<head>
		<meta charset="utf-8" />
		<title>RESTful Bottle Wiki: {{ page.name }}</title>
	</head>

	<body id="home">
		<h1>{{ page.name }}</h1>
		<p>{{ page.content }}</p>
		<p>
			[<a href="{{ page.name }}/edit">Edit</a>] [<a href="{{ page.name }}/delete">Delete</a>] [<a href="/wikis">Go back to list of wiki pages</a>]
		</p>
	</body>
</html>