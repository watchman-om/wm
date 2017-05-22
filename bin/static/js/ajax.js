function ajax_refresh_alerts(callback) {
	$.ajax({
		type:"POST",
		url:"/alerts",
		data : {},
		dataType : "json",
        async: true,
	    success: function(json){
	    	callback(json);
	    },
	    error: function(xhr, status, error) {
	        alert(error);
	    }
	});
}

function ajax_get_vehicle(callback) {
	$.ajax({
		type:"POST",
		url:"/vehicle",
		data : {},
		dataType : "json",
        async: true,
	    success: function(json){
	    	callback(json);
	    },
	    error: function(xhr, status, error) {
	        alert(error);
	    }
	});
}

function ajax_get_history(callback) {
	$.ajax({
		type:"POST",
		url:"/history",
		data : {},
		dataType : "json",
        async: true,
	    success: function(json){
	    	callback(json);
	    },
	    error: function(xhr, status, error) {
	        alert(error);
	    }
	});
}

function ajax_get_employee(callback) {
	$.ajax({
		type:"POST",
		url:"/employee",
		data : {},
		dataType : "json",
        async: true,
	    success: function(json){
	    	callback(json);
	    },
	    error: function(xhr, status, error) {
	        alert(error);
	    }
	});
}

function ajax_get_vehicle_management(callback) {
	$.ajax({
		type:"POST",
		url:"/vehicle_management",
		data : {},
		dataType : "json",
        async: true,
	    success: function(json){
	    	callback(json);
	    },
	    error: function(xhr, status, error) {
	        alert(error);
	    }
	});
}

function ajax_get_management(callback) {
	$.ajax({
		type:"POST",
		url:"/management",
		data : {},
		dataType : "json",
        async: true,
	    success: function(json){
	    	callback(json);
	    },
	    error: function(xhr, status, error) {
	        alert(error);
	    }
	});
}