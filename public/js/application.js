$(document).ready(function() {

	$(".btn-login").click(function(event) {
		event.preventDefault();
		$.ajax({
			url: "/login",
			type: "GET"
			}).done(function(response) {
				$(".login").toggle();
			})
		});	
	});
