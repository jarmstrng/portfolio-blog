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

	$("form.new").submit(function(event) {
			event.preventDefault();
			var route = "/comment/new/" + $("form.new").data("post-id");

			$.ajax({
				url: route,
				type: "POST",
				data: $(this).serialize()
				}).done(function(response) {
					console.log("blarg");

					console.log(response);
					$(".form-comment").prepend(response);
				})
			});	


	});
