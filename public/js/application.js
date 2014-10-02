$(document).ready(function() {

	var loginDoneHandler = function(response) {
			$(".btn#login").hide();
			$(".btn#signup").hide();
			$(".nav").append(response);
			$(".janky-form").show();
		};

	$(".btn#login").click(function(event) {
		event.preventDefault();
		$.ajax({
			url: "/login",
			type: "GET"
			}).done(function(response) {
				$(".login").toggle();
				$(".signup").hide();
			})
		});	

	$("form.login-form").submit(function(event) {
		event.preventDefault();
		$.ajax({
			url: "/login",
			type: "POST",
			data: $(this).serialize()
			}).done(function(response) {
				$(".login").toggle();
				loginDoneHandler(response);
			})
		});	

	$(".btn#signup").click(function(event) {
		event.preventDefault();
		$.ajax({
			url: "/signup",
			type: "GET"
			}).done(function(response) {
				$(".signup").toggle();
				$(".login").hide();
			})
		});	

	$("form.signup-form").submit(function(event) {
		event.preventDefault();
		$.ajax({
			url: "/signup",
			type: "POST",
			data: $(this).serialize()
			}).done(function(response) {
			$(".signup").toggle();
			loginDoneHandler(response);
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
					$(".form-comment").prepend(response);
				})
			});	

	});
