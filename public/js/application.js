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

	$("form.login-form").submit(function(event) {
		event.preventDefault();
		$.ajax({
			url: "/login",
			type: "POST",
			data: $(this).serialize()
			}).done(function(response) {
				$(".login").toggle();
				$(".btn-login").hide();
				$(".btn#signup").hide();
				$(".nav").append(response);
				$(".janky-form").show();
			})
		});	

	$(".btn#signup").click(function(event) {
		event.preventDefault();
		$.ajax({
			url: "/signup",
			type: "GET"
			}).done(function(response) {
				$(".signup").toggle();
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
				$(".btn-login").hide();
				$(".btn#signup").hide();
				$(".nav").append(response);
				$(".janky-form").show();
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
