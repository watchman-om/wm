<html>
<head></head>
<body>
<div id="vehicle_list"></div>
    <script src="js/vendor/jquery.min.js"></script>
	<script>
		var vehicle_id = 0;
		var msg;
		var format;
		var columnsIn;
		if(typeof(EventSource) !== "undefined") {
		    var source = new EventSource("/sseTest");
		    source.onmessage = function(event) {
		    	msg = JSON.parse(event.data);
		    	format = "";
		    	for(var i = 0, item; item = msg[i]; i++) {
					item = JSON.parse(JSON.stringify(item));
		    		if(vehicle_id < item.vehicle_ID) {
		    			vehicle_id = item.vehicle_ID;
			    		format = format + "<div id='vehicle"+item.vehicle_ID+"'>";
						for(var key in item) {
							format = format + "<span class='"+key.toUpperCase()+"'>"+item[key]+"</span>";
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
		function sleep(ms) {
			return new Promise(resolve => setTimeout(resolve, ms));
		}
		function reset(item) {
			for(var key in item) {
				if($("#vehicle"+item.vehicle_ID+" ."+key.toUpperCase()).html() != item[key]) {
					$("#vehicle"+item.vehicle_ID+" ."+key.toUpperCase()).html(item[key]);
				}
			}
		}
	</script>
</body>
</html>