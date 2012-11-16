<!DOCTYPE html>
<html lang="en">
	<head>
		<meta charset="utf-8" />
		<title>RESTful Bottle Wiki: Creating {{ name }}</title>
	</head>

	<body id="home">
		<h1>{{ name }}</h1>
		<p>
			<i>This wiki page does not yet exist. To create it, add content below.</i>
		</p>
		<form name="wiki_create" method="POST" action="/wikis/{{ name }}">
			<textarea id="content" name="content"></textarea>
			<div id="controls">
				<input type="submit" />
				<input type="button" value="Cancel" onClick="location.href='/wikis'" />
			</div>
		</form>
	</body>
</html>