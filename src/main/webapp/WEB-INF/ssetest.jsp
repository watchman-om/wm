<html>
<head>
	<style>
		span {
			display: inline-block;
			width: 100px;
			padding: 5px;
		}
	</style>
</head>
<body>
<div id="vehicle_list"></div>
<input id="stop_sse" type="button">
    <script src="js/vendor/jquery.min.js"></script>
	<script>
		var vehicle_id = 0;
		var msg;
		var format;
		var columnsIn;
		var value;
		var source;
		if(typeof(EventSource) !== "undefined") {
		    source = new EventSource("/sseTest");
		    // 끄기
		    // source.onmessage.close();
		    source.onmessage = function(event) {
		    	msg = JSON.parse(event.data);
		    	format = "";
		    	for(var i = 0, item; item = msg[i]; i++) {
					item = JSON.parse(JSON.stringify(item));
		    		if(vehicle_id < item.vehicle_ID) {
		    			vehicle_id = item.vehicle_ID;
			    		format = format + "<div id='vehicle"+item.vehicle_ID+"'>";
						for(var key in item) {
							value = item[key];
							if(value == null)
								value = "";
							format = format + "<span class='"+key.toUpperCase()+"'>"+value+"</span>";
						}
			    		format = format + "</div>";
		    		}
		    		else {
		    			reset(item);
		    		}
		    	}
	    		$("#vehicle_list").append(format);
		    };
		} else {
		    document.getElementById("sseDiv").innerHTML = "Your browser does not support server-sent events.";
		}
		function reset(item) {
			for(var key in item) {
				if($("#vehicle"+item.vehicle_ID+" ."+key.toUpperCase()).html() != item[key]) {
					$("#vehicle"+item.vehicle_ID+" ."+key.toUpperCase()).html(item[key]);
				}
			}
		}
		$("#stop_sse").click(function() {
			source.close();
		});
	</script>
</body>
</html>