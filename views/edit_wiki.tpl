<!DOCTYPE html>
<html lang="en">
	<head>
		<meta charset="utf-8" />
		<title>RESTful Bottle Wiki: Editing {{ page.name }}</title>
	</head>

	<body id="home">
		<h1>Editing {{ page.name }}</h1>
		<form name="wiki_edit" method="POST" action="/wikis/{{ page.name }}">
			<textarea id="content" name="content">{{ page.content }}</textarea>
			<div id="controls">
				<input type="submit" />
				<input type="button" value="Cancel" onClick="location.href='/wikis/{{ page.name }}'" />
			</div>
		</form>
	</body>
</html>