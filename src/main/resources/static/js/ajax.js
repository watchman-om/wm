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
		type:"GET",
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

function ajax_get_all_history(callback) {
	$.ajax({
		type:"GET",
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

function ajax_insert_vehicle(license, is_notifiable, callback) {
	$.ajax({
		type:"POST",
		url:"/vehicle",
		data : {LICENSE: license, IS_NOTIFIABLE: is_notifiable},
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

function ajax_update_vehicle(vehicle_id, license, is_notifiable, model, user_name, birth, phone_number, comment, callback) {
	$.ajax({
		type:"POST",
		url:"/vehicle/"+vehicle_id,
		data : {VEHICLE_ID: vehicle_id, LICENSE: license, IS_NOTIFIABLE: is_notifiable, MODEL: model, USER_NAME: user_name, BIRTH: birth, PHONE_NUMBER: phone_number, COMMENT: comment},
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

function ajax_delete_vehicle(vehicle_id, callback) {
	$.ajax({
		type:"DELETE",
		url:"/vehicle/"+vehicle_id,
		data : {},
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

function ajax_get_history(param, callback) {
	$.ajax({
		type:"GET",
		url:"/history"+param,
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

function ajax_update_vehicle_user_name(vehicle_id, user_name, callback) {
	$.ajax({
		type:"POST",
		url:"/update_vehicle_user_name",
		data : {VEHICLE_ID: vehicle_id, USER_NAME: user_name},
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

function ajax_update_vehicle_phone_number(vehicle_id, phone_number, callback) {
	$.ajax({
		type:"POST",
		url:"/update_vehicle_phone_number",
		data : {VEHICLE_ID: vehicle_id, PHONE_NUMBER: phone_number},
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

function ajax_update_vehicle_birth(vehicle_id, birth, callback) {
	$.ajax({
		type:"POST",
		url:"/update_vehicle_birth",
		data : {VEHICLE_ID: vehicle_id, BIRTH: birth},
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

function ajax_update_vehicle_comment(vehicle_id, comment, callback) {
	$.ajax({
		type:"POST",
		url:"/update_vehicle_comment",
		data : {VEHICLE_ID: vehicle_id, COMMENT: comment},
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

function ajax_insert_vehicle_total(license, is_notifiable, model, user_name, birth, phone_number, comment, callback) {
	$.ajax({
		type:"POST",
		url:"/vehicle",
		data : {LICENSE: license, IS_NOTIFIABLE: is_notifiable, MODEL: model, USER_NAME: user_name, BIRTH: birth, PHONE_NUMBER: phone_number, COMMENT: comment},
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