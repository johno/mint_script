<% if defined?(script) and script %>
	<script type='text/javascript'>
		$(window).ready(function() { $().initializeEditor('<%= j script.content %>'); });
	</script>
<% end %>