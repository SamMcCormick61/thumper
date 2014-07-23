(function(){
	var song;
	$(document).ready(function(){
		setup();
	});

	window.dim = {x:0, y:0};

	function resize(){
		dim.x = Math.floor(window.innerWidth)-500;
		dim.y = Math.floor(window.innerHeight);
		c.setAttribute("width",dim.x);
		c.setAttribute("height", dim.y);
	}

	function update(html){
		$("body").html(html);
	}

	function setup(){
		$("#done li").click(function(e){
			player.addSong($(this).text());
		});

		window.c = document.getElementById("viz");
		window.ctx = c.getContext("2d");
		// ctx.globalAlpha = 0.5;
		ctx.globalCompositeOperation = "copy";

		window.onresize = resize;
		resize();
	}

	$("#upload").submit(function(e){
		e.preventDefault();

		var formData = new FormData();
		var file = $("#upload")[0].file.files[0]

		if (! file) return;

		formData.append("file", file);

		$.ajax({
			url: "/upload",
			type: "POST",
			data: formData,
			processData: false,
			contentType: false,
			success: update,
			failure: function(res){
				debugger;
			}
		});
		return false;
	});
})();