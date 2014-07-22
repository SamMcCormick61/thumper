//(function(){
	var MUSIC = "/static/music/";
	var LED = "/static/LED/";

	var $audio = $("audio");
	var audio = $audio[0];
	var $progress = $("progress");

	var fadeIn = 50;
	function beat(){
		$("body").animate({
			backgroundColor: "#aa0000"
		}, fadeIn, "linear", function(){
			$("body").animate({
				backgroundColor: "#fff",
			}, fadeIn*2);
		})
	}

	function animate(freq_mag){
		var i;
		var $viz = $("#viz");
		_.each(freq_mag, function(elt, i){
			var $block = $viz.find("#"+i);
			$block.css('height', Math.max(freq_mag[i]*3, 1));
			/*
			$block.animate({
				height: freq_mag[i] * 10
			}, 0, function(){
				$block.animate({
					height: 10
				}, 50);
			});
			*/
		});
	}

	function updateTime(){
		var c = audio.currentTime;
		var d = audio.duration;

		if (isNaN(d) || !d) {
			return ;
		}
		var progress = (c * 100) / d;
		$progress.val(progress);

		var nextBeat = player.LED[player.loc];
		while(nextBeat !== undefined) {
			var nextBeatTime = nextBeat.time;
			if(nextBeatTime < c){
				// no point we merely fucked up
			} else if (nextBeatTime - c < 1) {
				setTimeout((function(f){
					return function(){ animate(f); }
				})(nextBeat.freq_mag),  (nextBeatTime - c) * 1000);

			} else if (nextBeatTime - c >= 1) {
				break;
			}
			player.loc += 1;
			nextBeat = player.LED[player.loc];
		}
	}

	function getLED(file, success){
		$.ajax({
			url: LED + file + ".LED",
			method: "GET",
			dataType:"json",
			success: success
		});
	}
	function makeViz(count){
		var i;
		var $viz = $("#viz");
		$viz.html('');
		for(i = 0; i < count; i++){
			var $block = $("<div></div>");
			$block.attr({
				class: 'block',
				id: i,
			}).css({
				width:'10px',
				height:'10px',
				'background-color':'grey',
				float:'left'
			});
			$viz.append($block);
		}
	}

	function addSong(file){
		audio.pause();
		player.file = file;
		player.name = file.split(".").slice(0,-1).join(".");

		getLED(player.name, function(json){
			makeViz(json[0].freq_mag.length);
			player.loc = 0;
			player.LED = json;
			audio.src = MUSIC + file;


			$progress.val(0);

			$audio.bind('canplay', function() {
				audio.currentTime = 0;
				$audio.bind('timeupdate', updateTime);
				audio.play();
			});

		});


	}
	var pause = true;
	$("#pause").click(function(e){
		if (pause) {
			audio.pause();
		} else {
			audio.play();
		}
		pause = !pause;
	})
	window.player = {
		name: "",
		file: "",
		addSong : addSong,
		LED: [],
		loc: 0
	};
//})();