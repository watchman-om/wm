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

function ajax_toggle_notifiable(vehicle_id, is_notifiable, callback) {
	$.ajax({
		type:"POST",
		url:"/toggle_notifiable",
		data : {VEHICLE_ID: vehicle_id, IS_NOTIFIABLE: is_notifiable},
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

function ajax_update_vehicle_model(vehicle_id, model, callback) {
	$.ajax({
		type:"POST",
		url:"/update_vehicle_model",
		data : {VEHICLE_ID: vehicle_id, MODEL: model},
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

function ajax_submit_management(is_new, vehicle_id, management_id, date_mng, comment, callback) {
	$.ajax({
		type:"POST",
		url:"/submit_management",
		data : {IS_NEW: is_new, VEHICLE_ID: vehicle_id, MANAGEMENT_ID: management_id, DATE_MNG: date_mng, COMMENT: comment},
		dataType : "json",
		async: true,
		success: function(json) {
			callback(json);
		},
		error: function(xhr, status, error) {
			alert(error);
		}
	});
}